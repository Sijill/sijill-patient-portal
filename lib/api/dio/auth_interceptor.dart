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
  // Decode JWT expiry
  // ==============================
  int? getTokenExpiry(String token) {
    try {
      final parts = token.split('.');

      if (parts.length != 3) return null;

      final payload = jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))),
      );

      return payload['exp'];
    } catch (_) {
      return null;
    }
  }

  // ==============================
  // Refresh Token
  // ==============================
  Future<String?> _refreshToken() async {
    if (_isRefreshing) return SharedPrefsUtils.getAccessToken();

    _isRefreshing = true;

    try {
      final refreshToken = SharedPrefsUtils.getRefreshToken();

      if (refreshToken == null || refreshToken.isEmpty) {
        await SharedPrefsUtils.logout();
        return null;
      }

      refreshDio.options.headers.remove("Authorization");

      final response = await refreshDio.post(
        Endpoints.refreshTokenApi,
        data: {"refreshToken": refreshToken, "platform": "mobile"},
      );

      final newAccessToken = response.data["accessToken"];

      final newRefreshToken = response.data["refreshToken"];

      await SharedPrefsUtils.saveData(
        key: "accessToken",
        value: newAccessToken,
      );

      await SharedPrefsUtils.saveData(
        key: "refreshToken",
        value: newRefreshToken,
      );

      // مهم
      dio.options.headers["Authorization"] = "Bearer $newAccessToken";

      return newAccessToken;
    } catch (e) {
      print("REFRESH ERROR => $e");

      await SharedPrefsUtils.logout();

      return null;
    } finally {
      _isRefreshing = false;
    }
  }

  // ==============================
  // Before Request
  // ==============================
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = SharedPrefsUtils.getAccessToken();

    options.headers["Authorization"] = "Bearer ${token ?? ""}";

    handler.next(options);
  }

  // ==============================
  // Handle 401
  // ==============================
  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final request = err.requestOptions;

    if (request.path.contains("refresh")) {
      return handler.next(err);
    }

    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    if (request.extra["retry"] == true) {
      await SharedPrefsUtils.logout();

      return handler.next(err);
    }

    try {
      final token = await _refreshToken();

      if (token == null) {
        return handler.next(err);
      }

      request.headers["Authorization"] = "Bearer $token";

      request.extra["retry"] = true;

      final response = await dio.fetch(request);

      handler.resolve(response);
    } catch (e) {
      print("401 RETRY ERROR => $e");

      await SharedPrefsUtils.logout();

      handler.next(err);
    }
  }
}
