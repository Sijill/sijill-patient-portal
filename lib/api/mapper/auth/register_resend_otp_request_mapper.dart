import 'package:sijil_patient_portal/api/model/auth/request/register/register_resend_otp_request_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_resend_otp_request.dart';

extension RegisterResendOtpRequestMapper on RegisterResendOtpRequest {
  RegisterResendOtpRequestDto convertToRegisterResendOtpRequest() {
    return RegisterResendOtpRequestDto(
      registrationSessionId: registrationSessionId,
    );
  }
}
