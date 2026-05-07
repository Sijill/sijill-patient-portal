import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sijil_patient_portal/api/endpoints/endpoints.dart';
import 'package:sijil_patient_portal/core/cache/shared_prefs_utils.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final Dio refreshDio;

  AuthInterceptor(this.dio, this.refreshDio);

  bool _isRefreshing = false;

  // ==============================
  // 🔹 Decode JWT expiry
  // ==============================
  int? _getTokenExpiry(String token) {
    try {
      final parts = token.split('.');

      if (parts.length != 3) return null;

      final payload = jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))),
      );

      return payload['exp'];
    } catch (e) {
      return null;
    }
  }

  // ==============================
  // 🔹 Refresh Token
  // ==============================
  Future<String?> _refreshToken() async {
    if (_isRefreshing) return null;

    _isRefreshing = true;

    try {
      final refreshToken = SharedPrefsUtils.getRefreshToken();

      if (refreshToken == null || refreshToken.isEmpty) {
        return null;
      }

      // ❌ remove old auth header
      refreshDio.options.headers.remove("Authorization");

      final response = await refreshDio.post(
        Endpoints.refreshTokenApi,
        data: {"refreshToken": refreshToken, "platform": "mobile"},
      );

      final newAccessToken = response.data["accessToken"];
      final newRefreshToken = response.data["refreshToken"];

      // ✅ save new tokens
      await SharedPrefsUtils.saveData(
        key: "accessToken",
        value: newAccessToken,
      );

      await SharedPrefsUtils.saveData(
        key: "refreshToken",
        value: newRefreshToken,
      );

      return newAccessToken;
    } catch (e) {
      return null;
    } finally {
      _isRefreshing = false;
    }
  }

  // ==============================
  // 🔹 Before Request
  // ==============================
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String? token = SharedPrefsUtils.getAccessToken();

    if (token != null && token.isNotEmpty) {
      final exp = _getTokenExpiry(token);

      final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      // ⏳ لو التوكن قرب يخلص
      if (exp != null && (exp - now) < 60) {
        final refreshedToken = await _refreshToken();

        if (refreshedToken != null) {
          token = refreshedToken;
        }
      }

      options.headers["Authorization"] = "Bearer $token";
    }

    handler.next(options);
  }

  // ==============================
  // 🔹 Handle 401 Errors
  // ==============================
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final requestOptions = err.requestOptions;

    //  ignore refresh endpoint
    if (requestOptions.path.contains("refresh")) {
      return handler.next(err);
    }

    //  only handle 401
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    //  prevent infinite loop
    if (requestOptions.extra["retry"] == true) {
      return handler.next(err);
    }

    try {
      final newAccessToken = await _refreshToken();

      //  refresh failed
      if (newAccessToken == null) {
        return handler.next(err);
      }

      // ==============================
      // 🔹 Retry Original Request
      // ==============================
      final newRequest = requestOptions.copyWith(
        headers: {
          ...requestOptions.headers,
          "Authorization": "Bearer $newAccessToken",
        },
        extra: {...requestOptions.extra, "retry": true},
      );

      final response = await dio.fetch(newRequest);

      return handler.resolve(response);
    } catch (e) {
      return handler.next(err);
    }
  }
}
