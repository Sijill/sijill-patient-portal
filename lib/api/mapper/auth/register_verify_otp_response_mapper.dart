import 'package:sijil_patient_portal/api/model/auth/response/register/register_verify_otp_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/register/register_verify_otp_response.dart';

extension RegisterVerifyOtpResponseMapper on RegisterVerifyOtpResponseDto {
  RegisterVerifyOtpResponse convertToRegisterVerifyOtpResponse() {
    return RegisterVerifyOtpResponse(registrationStatus: registrationStatus);
  }
}
