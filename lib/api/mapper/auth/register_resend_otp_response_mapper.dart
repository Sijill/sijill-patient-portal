import 'package:sijil_patient_portal/api/model/auth/response/register/register_resend_otp_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/register/register_resend_otp_response.dart';

extension RegisterResendOtpResponseMapper on RegisterResendOtpResponseDto {
  RegisterResendOtpResponse convertToRegisterResendOtpResponse() {
    return RegisterResendOtpResponse(
      expiresAt: expiresAt,
      otpDelivery: otpDelivery,
      registrationSessionId: registrationSessionId,
    );
  }
}
