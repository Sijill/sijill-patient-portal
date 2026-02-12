import 'package:sijil_patient_portal/api/model/auth/response/password_reset/password_reset_resend_otp_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/password_reset/password_reset_resend_otp_response.dart';

extension PasswordResetResendOtpResponseMapper
    on PasswordResetResendOtpResponseDto {
  PasswordResetResendOtpResponse convertToPasswordResetResendOtpResponse() {
    return PasswordResetResendOtpResponse(
      expiresAt: expiresAt,
      otpDelivery: otpDelivery,
      resetSessionId: resetSessionId,
    );
  }
}
