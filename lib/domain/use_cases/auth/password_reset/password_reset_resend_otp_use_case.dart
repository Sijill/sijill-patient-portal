import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_resend_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/password_reset/password_reset_resend_otp_response.dart';
import 'package:sijil_patient_portal/domain/repositories/auth/auth_repository.dart';

@injectable
class PasswordResetResendOtpUseCase {
  AuthRepository authRepository;
  PasswordResetResendOtpUseCase({required this.authRepository});
  Future<PasswordResetResendOtpResponse> invoke(
    PasswordResetResendOtpRequest passwordResetResendOtpRequest,
  ) {
    return authRepository.passwordResetResendOtp(passwordResetResendOtpRequest);
  }
}
