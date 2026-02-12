import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sijil_patient_portal/api/dio/auth_interceptor.dart';
import 'package:sijil_patient_portal/api/dio/dio_interceptors.dart';
import 'package:sijil_patient_portal/api/endpoints/endpoints.dart';
import 'package:sijil_patient_portal/api/web_service.dart';

@module
abstract class DioModule {
  @singleton
  BaseOptions provideBaseOptions() => BaseOptions(
    baseUrl: Endpoints.baseUrl,
    connectTimeout: const Duration(seconds: 20),
    sendTimeout: const Duration(seconds: 20),
  );

  @singleton
  PrettyDioLogger providePrettyDioLogger() => PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    error: true,
    compact: true,
  );

  @singleton
  @Named("refreshDio")
  Dio provideRefreshDio(BaseOptions baseOptions) {
    return Dio(baseOptions);
  }

  @singleton
  @Named("mainDio")
  Dio provideDio(
    BaseOptions baseOptions,
    PrettyDioLogger prettyDioLogger,
    @Named("refreshDio") Dio refreshDio,
  ) {
    final dio = Dio(baseOptions);

    dio.interceptors.add(DioInterceptors());
    dio.interceptors.add(prettyDioLogger);
    dio.interceptors.add(AuthInterceptor(dio, refreshDio));

    return dio;
  }

  @singleton
  WebService provideWebService(@Named("mainDio") Dio dio) => WebService(dio);
}
