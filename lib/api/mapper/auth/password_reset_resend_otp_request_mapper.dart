import 'package:sijil_patient_portal/api/model/auth/request/password_reset/password_reset_resend_otp_request_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_resend_otp_request.dart';

extension PasswordResetResendOtpRequestMapper on PasswordResetResendOtpRequest {
  PasswordResetResendOtpRequestDto convertToPasswordResetResendOtpRequestDto() {
    return PasswordResetResendOtpRequestDto(resetSessionId: resetSessionId);
  }
}
