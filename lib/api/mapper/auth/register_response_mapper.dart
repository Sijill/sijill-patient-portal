import 'package:sijil_patient_portal/api/model/auth/response/register/register_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/register/register_response.dart';

extension RegisterResponseMapper on RegisterResponseDto {
  RegisterResponse convertToRegisterResponse() {
    return RegisterResponse(
      expiresAt: expiresAt,
      otpDelivery: otpDelivery,
      registrationSessionId: registrationSessionId,
    );
  }
}
