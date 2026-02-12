import 'package:sijil_patient_portal/api/model/auth/request/password_reset/password_reset_request_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_request.dart';

extension PasswordResetRequestMapper on PasswordResetRequest {
  PasswordResetRequestDto convertToPasswordResetRequestDto() {
    return PasswordResetRequestDto(email: email);
  }
}
