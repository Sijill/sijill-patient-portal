import 'package:sijil_patient_portal/api/model/auth/response/login/login_resend_otp_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/login/login_resend_otp_response.dart';

extension LoginResendOtpResponseMapper on LoginResendOtpResponseDto {
  LoginResendOtpResponse convertToLoginResendOtpResponse() {
    return LoginResendOtpResponse(
      expiresAt: expiresAt,
      loginSessionId: loginSessionId,
      otpDelivery: otpDelivery,
    );
  }
}
