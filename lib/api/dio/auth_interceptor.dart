import 'package:dio/dio.dart';
import 'package:sijil_patient_portal/api/endpoints/endpoints.dart';
import 'package:sijil_patient_portal/core/cache/shared_prefs_utils.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final Dio refreshDio;

  bool _isRefreshing = false;

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
    if (err.response?.statusCode == 401 && !_isRefreshing) {
      _isRefreshing = true;

      try {
        final refreshToken = SharedPrefsUtils.getRefreshToken();

        final response = await refreshDio.post(
          Endpoints.refreshTokenApi,
          data: {"refreshToken": refreshToken},
          options: Options(
            headers: {
              "Authorization": "Bearer ${SharedPrefsUtils.getAccessToken()}",
            },
          ),
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

        _isRefreshing = false;

        final clonedRequest = await dio.fetch(err.requestOptions);
        return handler.resolve(clonedRequest);
      } catch (e) {
        _isRefreshing = false;
        return handler.next(err);
      }
    }

    return handler.next(err);
  }
}
