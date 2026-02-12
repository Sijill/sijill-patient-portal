import 'package:sijil_patient_portal/domain/entities/auth/request/login/login_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/login/login_resend_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/login/login_verfiy_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_confirm_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_resend_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_resend_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_verify_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/login/login_resend_otp_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/login/login_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/login/login_verify_otp_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/password_reset/password_reset_confirm_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/password_reset/password_reset_resend_otp_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/password_reset/password_reset_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/register/register_resend_otp_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/register/register_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/register/register_verify_otp_response.dart';

abstract class AuthDataSources {
  Future<RegisterResponse> register(RegisterRequest registerRequest);
  Future<RegisterResendOtpResponse> registerResendOtp(
    RegisterResendOtpRequest registerResendOtpRequest,
  );
  Future<RegisterVerifyOtpResponse> registerVerifyOtp(
    RegisterVerifyOtpRequest registerVerifyOtpRequest,
  );

  Future<LoginResponse> login(LoginRequest loginRequest);

  Future<LoginResendOtpResponse> loginResendOtp(
    LoginResendOtpRequest loginResendOtpRequest,
  );

  Future<LoginVerifyOtpResponse> loginVerifyOtp(
    LoginVerfiyOtpRequest loginVerfiyOtpRequest,
  );

  Future<PasswordResetResponse> passwordReset(
    PasswordResetRequest passwordResetRequest,
  );

  Future<PasswordResetResendOtpResponse> passwordResetResendOtp(
    PasswordResetResendOtpRequest passwordResetResendOtpRequest,
  );

  Future<PasswordResetConfirmResponse> passwordResetConfirm(
    PasswordResetConfirmRequest passwordResetConfirmRequest,
  );
}
