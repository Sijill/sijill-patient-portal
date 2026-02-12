import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sijil_patient_portal/api/endpoints/endpoints.dart';
import 'package:sijil_patient_portal/api/model/auth/request/login/login_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/login/login_resend_otp_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/login/login_verify_otp_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/password_reset/password_reset_confirm_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/password_reset/password_reset_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/password_reset/password_reset_resend_otp_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/register/register_resend_otp_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/register/register_verify_otp_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/login/login_resend_otp_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/login/login_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/login/login_verify_otp_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/password_reset/password_reset_confirm_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/password_reset/password_reset_resend_otp_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/password_reset/password_reset_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/register/register_resend_otp_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/register/register_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/register/register_verify_otp_response_dto.dart';

part 'web_service.g.dart';

@RestApi()
abstract class WebService {
  factory WebService(Dio dio, {String? baseUrl}) = _WebService;

  @POST(Endpoints.registerApi)
  @MultiPart()
  Future<RegisterResponseDto> register(
    @Part(name: 'role') String role,
    @Part(name: 'email') String email,
    @Part(name: 'phoneNumber') String phoneNumber,
    @Part(name: 'password') String password,
    @Part(name: 'firstName') String firstName,
    @Part(name: 'middleName') String middleName,
    @Part(name: 'surName') String surName,
    @Part(name: 'gender') String gender,
    @Part(name: 'dateOfBirth') String dateOfBirth,
    @Part(name: 'nationalId') String nationalId,
    @Part(name: 'nationalIdFront') MultipartFile nationalIdFront,
    @Part(name: 'nationalIdBack') MultipartFile nationalIdBack,
    @Part(name: 'selfieWithId') MultipartFile selfieWithId,
  );

  @POST(Endpoints.registerResendOtpApi)
  Future<RegisterResendOtpResponseDto> registerResendOtp(
    @Body() RegisterResendOtpRequestDto registerResendOtpRequest,
  );

  @POST(Endpoints.registerVerifyOtpApi)
  Future<RegisterVerifyOtpResponseDto> registerVerifyOtp(
    @Body() RegisterVerifyOtpRequestDto registerVerifyOtpRequestDto,
  );

  @POST(Endpoints.loginApi)
  Future<LoginResponseDto> login(@Body() LoginRequestDto loginRequest);

  @POST(Endpoints.loginResendOtpApi)
  Future<LoginResendOtpResponseDto> loginResendOtp(
    @Body() LoginResendOtpRequestDto loginResendOtpRequest,
  );

  @POST(Endpoints.loginVerifyOtpApi)
  Future<LoginVerifyOtpResponseDto> loginVerifyOtp(
    @Body() LoginVerifyOtpRequestDto loginVerfiyOtpRequest,
  );

  @POST(Endpoints.passwordResetApi)
  Future<PasswordResetResponseDto> passwordReset(
    @Body() PasswordResetRequestDto passwordResetRequest,
  );

  @POST(Endpoints.passwordResetResendOtpApi)
  Future<PasswordResetResendOtpResponseDto> passwordResetResendOtp(
    @Body() PasswordResetResendOtpRequestDto passwordResetResendOtpRequest,
  );

  @POST(Endpoints.passwordResetConfirmApi)
  Future<PasswordResetConfirmResponseDto> passwordResetConfirm(
    @Body() PasswordResetConfirmRequestDto passwordResetConfirmRequest,
  );
}
