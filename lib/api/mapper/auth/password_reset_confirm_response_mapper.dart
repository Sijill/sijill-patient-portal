import 'package:sijil_patient_portal/api/model/auth/response/password_reset/password_reset_confirm_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/password_reset/password_reset_confirm_response.dart';

extension PasswordResetConfirmResponseMapper
    on PasswordResetConfirmResponseDto {
  PasswordResetConfirmResponse convertToPasswordResetConfirmResponse() {
    return PasswordResetConfirmResponse(code: code, message: message);
  }
}
