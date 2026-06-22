import 'package:sijil_patient_portal/api/model/auth/response/logout/logout_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/logout/logout_response.dart';

extension LogoutResponseMapper on LogoutResponseDto {
  LogoutResponse convertToLogoutResponse() {
    return LogoutResponse(message: message, success: success);
  }
}
