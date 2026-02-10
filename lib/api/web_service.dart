import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sijil_patient_portal/api/endpoints/endpoints.dart';
import 'package:sijil_patient_portal/api/model/auth/request/login/login_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/login/login_resend_otp_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/login/login_verfiy_otp_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/password_reset/password_reset_confirm_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/password_reset/password_reset_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/password_reset/password_reset_resend_otp_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/refresh_token/refresh_token_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/register/register_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/register/register_resend_otp_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/register/register_verify_otp_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/login/login_resend_otp_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/login/login_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/login/login_verify_otp_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/password_reset/password_reset_confirm_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/password_reset/password_reset_resend_otp_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/password_reset/password_reset_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/refresh_token/refresh_token_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/register/register_resend_otp_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/register/register_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/register/register_verify_otp_response_dto.dart';

part 'web_service.g.dart';

@RestApi()
abstract class WebService {
  factory WebService(Dio dio, {String? baseUrl}) = _WebService;

  @POST(Endpoints.registerApi)
  Future<RegisterResponseDto> register(
    @Body() RegisterRequestDto registerRequest,
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
    @Body() LoginVerfiyOtpRequestDto loginVerfiyOtpRequest,
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

  @POST(Endpoints.refreshTokenApi)
  Future<RefreshTokenResponseDto> refreshToken(
    @Body() RefreshTokenRequestDto refreshTokenRequest,
  );
}
