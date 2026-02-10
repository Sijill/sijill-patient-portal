import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/data/data_sources/remote/auth/auth_data_sources.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/login/login_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/login/login_resend_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/login/login_verfiy_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_confirm_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_resend_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/refresh_token/refresh_token_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_resend_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_verify_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/login/login_resend_otp_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/login/login_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/login/login_verify_otp_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/password_reset/password_reset_confirm_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/password_reset/password_reset_resend_otp_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/password_reset/password_reset_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/refresh_token/refresh_token_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/register/register_resend_otp_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/register/register_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/register/register_verify_otp_response.dart';
import 'package:sijil_patient_portal/domain/repositories/auth/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthDataSources authDataSources;
  AuthRepositoryImpl({required this.authDataSources});
  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) {
    return authDataSources.register(registerRequest);
  }

  @override
  Future<RegisterResendOtpResponse> registerResendOtp(
    RegisterResendOtpRequest registerResendOtpRequest,
  ) {
    return authDataSources.registerResendOtp(registerResendOtpRequest);
  }

  @override
  Future<RegisterVerifyOtpResponse> registerVerifyOtp(
    RegisterVerifyOtpRequest registerVerifyOtpRequest,
  ) {
    return authDataSources.registerVerifyOtp(registerVerifyOtpRequest);
  }

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) {
    return authDataSources.login(loginRequest);
  }

  @override
  Future<LoginResendOtpResponse> loginResendOtp(
    LoginResendOtpRequest loginResendOtpRequest,
  ) {
    return authDataSources.loginResendOtp(loginResendOtpRequest);
  }

  @override
  Future<LoginVerifyOtpResponse> loginVerifyOtp(
    LoginVerfiyOtpRequest loginVerfiyOtpRequest,
  ) {
    return authDataSources.loginVerifyOtp(loginVerfiyOtpRequest);
  }

  @override
  Future<PasswordResetResponse> passwordReset(
    PasswordResetRequest passwordResetRequest,
  ) {
    return authDataSources.passwordReset(passwordResetRequest);
  }

  @override
  Future<PasswordResetResendOtpResponse> passwordResetResendOtp(
    PasswordResetResendOtpRequest passwordResetResendOtpRequest,
  ) {
    return authDataSources.passwordResetResendOtp(
      passwordResetResendOtpRequest,
    );
  }

  @override
  Future<PasswordResetConfirmResponse> passwordResetConfirm(
    PasswordResetConfirmRequest passwordResetConfirmRequest,
  ) {
    return authDataSources.passwordResetConfirm(passwordResetConfirmRequest);
  }

  @override
  Future<RefreshTokenResponse> refreshToken(
    RefreshTokenRequest refreshTokenRequest,
  ) {
    return authDataSources.refreshToken(refreshTokenRequest);
  }
}
