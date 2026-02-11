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

abstract class AuthState {}

class AuthIntialState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterErrorState extends AuthState {
  String message;
  RegisterErrorState({required this.message});
}

class RegisterSccessState extends AuthState {
  RegisterResponse registerResponse;
  RegisterSccessState({required this.registerResponse});
}

class ChangeSelectGenderState extends AuthState {}

class RegisterResndOtpLoadingState extends AuthState {}

class RegisterResndOtpErrorState extends AuthState {
  String message;
  RegisterResndOtpErrorState({required this.message});
}

class RegisterResndOtpSccessState extends AuthState {
  RegisterResendOtpResponse registerResendOtpResponse;
  RegisterResndOtpSccessState({required this.registerResendOtpResponse});
}

class RegisterVerifyOtpLoadingState extends AuthState {}

class RegisterVerifyOtpErrorState extends AuthState {
  String message;
  RegisterVerifyOtpErrorState({required this.message});
}

class RegisterVerifyOtpSccessState extends AuthState {
  RegisterVerifyOtpResponse registerVerifyOtpResponse;
  RegisterVerifyOtpSccessState({required this.registerVerifyOtpResponse});
}

class LoginLoadingState extends AuthState {}

class LoginErrorState extends AuthState {
  String message;
  LoginErrorState({required this.message});
}

class LoginSccessState extends AuthState {
  LoginResponse loginResponse;
  LoginSccessState({required this.loginResponse});
}

class LoginResendOtpLoadingState extends AuthState {}

class LoginResendOtpErrorState extends AuthState {
  String message;
  LoginResendOtpErrorState({required this.message});
}

class LoginResendOtpSccessState extends AuthState {
  LoginResendOtpResponse loginResendOtpResponse;
  LoginResendOtpSccessState({required this.loginResendOtpResponse});
}

class LoginVerifyOtpLoadingState extends AuthState {}

class LoginVerifyOtpErrorState extends AuthState {
  String message;
  LoginVerifyOtpErrorState({required this.message});
}

class LoginVerifyOtpSccessState extends AuthState {
  LoginVerifyOtpResponse loginVerifyOtpResponse;
  LoginVerifyOtpSccessState({required this.loginVerifyOtpResponse});
}

class PasswordResetLoadingState extends AuthState {}

class PasswordResetErrorState extends AuthState {
  String message;
  PasswordResetErrorState({required this.message});
}

class PasswordResetSccessState extends AuthState {
  PasswordResetResponse passwordResetResponse;
  PasswordResetSccessState({required this.passwordResetResponse});
}

class PasswordResetResendOtpLoadingState extends AuthState {}

class PasswordResetResendOtpErrorState extends AuthState {
  String message;
  PasswordResetResendOtpErrorState({required this.message});
}

class PasswordResetResendOtpSccessState extends AuthState {
  PasswordResetResendOtpResponse passwordResetResendOtpResponse;
  PasswordResetResendOtpSccessState({
    required this.passwordResetResendOtpResponse,
  });
}

class PasswordResetConfirmLoadingState extends AuthState {}

class PasswordResetConfirmErrorState extends AuthState {
  String message;
  PasswordResetConfirmErrorState({required this.message});
}

class PasswordResetConfirmSccessState extends AuthState {
  PasswordResetConfirmResponse passwordResetConfirmResponse;
  PasswordResetConfirmSccessState({required this.passwordResetConfirmResponse});
}

class RefreshTokenLoadingState extends AuthState {}

class RefreshTokenErrorState extends AuthState {
  String message;
  RefreshTokenErrorState({required this.message});
}

class RefreshTokenSccessState extends AuthState {
  RefreshTokenResponse refreshTokenResponse;
  RefreshTokenSccessState({required this.refreshTokenResponse});
}
