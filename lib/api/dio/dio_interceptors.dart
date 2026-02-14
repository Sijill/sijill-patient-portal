import 'package:dio/dio.dart';
import 'package:sijil_patient_portal/core/exceptions/app_exception.dart';

class DioInterceptors extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppException exception;
    final responseData = err.response?.data;
    String message = "Something went wrong";

    if (responseData is Map) {
      message =
          (responseData["message"] as String?) ??
          (responseData["error"] as String?) ??
          (responseData["statusCode"]?.toString()) ??
          message;
    }

    // Network issues: no internet, timeout
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      exception = NetworkException(message: "No Internet Connection");
    }
    // Server responded with a bad status code
    else if (err.type == DioExceptionType.badResponse ||
        err.response?.statusCode != null) {
      final statusCode = err.response?.statusCode;
      exception = ServerException(message: message, statusCode: statusCode);
    }
    // Any other unknown error
    else {
      exception = UnKnownException(message: message);
    }

    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: exception,
      ),
    );
  }
}
