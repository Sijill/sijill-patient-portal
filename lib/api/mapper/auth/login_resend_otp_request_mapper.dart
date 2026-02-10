import 'package:sijil_patient_portal/api/model/auth/request/login/login_resend_otp_request_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/login/login_resend_otp_request.dart';

extension LoginResendOtpRequestMapper on LoginResendOtpRequest {
  LoginResendOtpRequestDto convertToLoginResendOtpRequestDto() {
    return LoginResendOtpRequestDto(loginSessionId: loginSessionId);
  }
}
