import 'package:dio/dio.dart';
import 'package:sijil_patient_portal/api/endpoints/endpoints.dart';
import 'package:sijil_patient_portal/core/cache/shared_prefs_utils.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final Dio refreshDio;

  bool _isRefreshing = false;
  final List<Future<void> Function()> _retryQueue = [];

  AuthInterceptor(this.dio, this.refreshDio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = SharedPrefsUtils.getAccessToken();

    if (token != null && token.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $token";
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.requestOptions.path.contains("refresh")) {
      return handler.next(err);
    }

    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    final requestOptions = err.requestOptions;

    if (_isRefreshing) {
      _retryQueue.add(() async {
        final newToken = SharedPrefsUtils.getAccessToken();
        requestOptions.headers["Authorization"] = "Bearer $newToken";

        final response = await dio.fetch(requestOptions);
        handler.resolve(response);
      });
      return;
    }

    _isRefreshing = true;

    try {
      final refreshToken = SharedPrefsUtils.getRefreshToken();

      if (refreshToken == null || refreshToken.isEmpty) {
        _isRefreshing = false;
        return handler.next(err);
      }

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

      for (final retry in _retryQueue) {
        await retry();
      }
      _retryQueue.clear();

      _isRefreshing = false;

      requestOptions.headers["Authorization"] = "Bearer $newAccessToken";

      final clonedRequest = await dio.fetch(requestOptions);
      return handler.resolve(clonedRequest);
    } catch (e) {
      _isRefreshing = false;
      _retryQueue.clear();

      return handler.next(err);
    }
  }
}
