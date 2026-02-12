import 'package:sijil_patient_portal/api/model/auth/request/register/register_verify_otp_request_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_verify_otp_request.dart';

extension RegisterVerifyOtpRequestMapper on RegisterVerifyOtpRequest {
  RegisterVerifyOtpRequestDto convertToRegisterVerifyOtpRequestDto() {
    return RegisterVerifyOtpRequestDto(
      otp: otp,
      registrationSessionId: registrationSessionId,
    );
  }
}
