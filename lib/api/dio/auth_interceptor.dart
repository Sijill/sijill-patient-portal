import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:sijil_patient_portal/api/endpoints/endpoints.dart';
import 'package:sijil_patient_portal/core/cache/shared_prefs_utils.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final Dio refreshDio;

  bool _isRefreshing = false;
  final List<Future<Response> Function()> _retryQueue = [];

  AuthInterceptor(this.dio, this.refreshDio);

  // ==============================
  // 🔹 Decode JWT expiry
  // ==============================
  int? _getTokenExpiry(String token) {
    try {
      final parts = token.split('.');
      final payload = jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))),
      );
      return payload['exp'];
    } catch (e) {
      return null;
    }
  }

  // ==============================
  // 🔹 Refresh Token Function
  // ==============================
  Future<void> _refreshToken() async {
    if (_isRefreshing) return;

    _isRefreshing = true;

    try {
      final refreshToken = SharedPrefsUtils.getRefreshToken();

      if (refreshToken == null || refreshToken.isEmpty) return;

      refreshDio.options.headers.remove("Authorization");

      final response = await refreshDio.post(
        Endpoints.refreshTokenApi,
        data: {"refreshToken": refreshToken},
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
    } catch (e) {
      // ❗ ممكن تعمل logout هنا
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
    final token = SharedPrefsUtils.getAccessToken();

    if (token != null && token.isNotEmpty) {
      final exp = _getTokenExpiry(token);
      final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      // ⏳ لو التوكن هيخلص خلال دقيقة → اعمل refresh
      if (exp != null && (exp - now) < 60) {
        await _refreshToken();
      }

      final newToken = SharedPrefsUtils.getAccessToken();
      options.headers["Authorization"] = "Bearer $newToken";
    }

    handler.next(options);
  }

  // ==============================
  // 🔹 Handle Errors (401)
  // ==============================
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final requestOptions = err.requestOptions;

    // ❌ تجاهل refresh endpoint
    if (requestOptions.path.contains("refresh")) {
      return handler.next(err);
    }

    // ❌ مش 401
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    // ❌ منع loop
    if (requestOptions.extra["retry"] == true) {
      return handler.next(err);
    }

    // ==============================
    // 🔸 لو فيه refresh شغال → queue
    // ==============================
    if (_isRefreshing) {
      final completer = Completer<Response>();

      _retryQueue.add(() async {
        final newToken = SharedPrefsUtils.getAccessToken();

        final newRequest = requestOptions.copyWith(
          headers: {
            ...requestOptions.headers,
            "Authorization": "Bearer $newToken",
          },
          extra: {"retry": true},
        );

        final response = await dio.fetch(newRequest);
        return response;
      });

      try {
        final response = await _retryQueue.last();
        return handler.resolve(response);
      } catch (e) {
        return handler.next(err);
      }
    }

    // ==============================
    // 🔸 اعمل refresh
    // ==============================
    _isRefreshing = true;

    try {
      final refreshToken = SharedPrefsUtils.getRefreshToken();

      if (refreshToken == null || refreshToken.isEmpty) {
        _isRefreshing = false;
        return handler.next(err);
      }

      refreshDio.options.headers.remove("Authorization");

      final response = await refreshDio.post(
        Endpoints.refreshTokenApi,
        data: {"refreshToken": refreshToken},
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

      // ==============================
      // 🔸 نفّذ queue
      // ==============================
      for (final retry in _retryQueue) {
        await retry();
      }
      _retryQueue.clear();

      _isRefreshing = false;

      // ==============================
      // 🔸 إعادة الطلب الأصلي
      // ==============================
      final newRequest = requestOptions.copyWith(
        headers: {
          ...requestOptions.headers,
          "Authorization": "Bearer $newAccessToken",
        },
        extra: {"retry": true},
      );

      final retryResponse = await dio.fetch(newRequest);

      return handler.resolve(retryResponse);
    } catch (e) {
      _isRefreshing = false;
      _retryQueue.clear();

      // ❗ Logout هنا لو عايز
      return handler.next(err);
    }
  }
}
