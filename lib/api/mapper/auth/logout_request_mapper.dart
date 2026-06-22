import 'package:sijil_patient_portal/api/model/auth/request/logout/logout_request_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/logout/logout_request.dart';

extension LogoutRequestMapper on LogoutRequest {
  LogoutRequestDto convertToLogoutRequestDto() {
    return LogoutRequestDto(platform: platform, refreshToken: refreshToken);
  }
}
