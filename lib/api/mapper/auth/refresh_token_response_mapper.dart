import 'package:sijil_patient_portal/api/model/auth/response/refresh_token/refresh_token_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/refresh_token/refresh_token_response.dart';

extension RefreshTokenResponseMapper on RefreshTokenResponseDto {
  RefreshTokenResponse convertToRefreshTokenResponse() {
    return RefreshTokenResponse(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
