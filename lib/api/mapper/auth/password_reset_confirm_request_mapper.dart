import 'package:sijil_patient_portal/api/model/auth/request/password_reset/password_reset_confirm_request_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_confirm_request.dart';

extension PasswordResetConfirmRequestMapper on PasswordResetConfirmRequest {
  PasswordResetConfirmRequestDto convertToPasswordResetConfirmRequestDto() {
    return PasswordResetConfirmRequestDto(
      newPassword: newPassword,
      otp: otp,
      resetSessionId: resetSessionId,
    );
  }
}
