import 'package:sijil_patient_portal/api/model/auth/request/refresh_token/refresh_token_request_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/refresh_token/refresh_token_request.dart';

extension RefreshTokenRequestMapper on RefreshTokenRequest {
  RefreshTokenRequestDto convertToRefreshTokenRequestDto() {
    return RefreshTokenRequestDto(refreshToken: refreshToken);
  }
}
