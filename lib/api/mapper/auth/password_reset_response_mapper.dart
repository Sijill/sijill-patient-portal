import 'package:sijil_patient_portal/api/model/auth/response/password_reset/password_reset_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/password_reset/password_reset_response.dart';

extension PasswordResetResponseMapper on PasswordResetResponseDto {
  PasswordResetResponse convertToPasswordResetResponse() {
    return PasswordResetResponse(
      expiresAt: expiresAt,
      otpDelivery: otpDelivery,
      resetSessionId: resetSessionId,
    );
  }
}
