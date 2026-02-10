import 'package:dio/dio.dart';
import 'package:sijil_patient_portal/core/exceptions/app_exception.dart';

class DioInterceptors extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppException exception;
    final responsData = err.response?.data;
    String message = "Something went wrong";

    if (responsData is Map) {
      message =
          (responsData['message'] as String?) ??
          (responsData['statusMsg'] as String?) ??
          message;
    }

    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout) {
      exception = NetworkException(message: "No Internet Connection");
    } else if (err.response?.statusCode != null) {
      exception = ServerException(
        message: message,
        statusCode: err.response?.statusCode,
      );
    } else {
      exception = UnKnownException(message: message);
    }

    handler.reject(
      DioException(requestOptions: err.requestOptions, error: exception),
    );
  }
}
