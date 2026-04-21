import 'package:sijil_patient_portal/api/model/permission_token/response/generate_permission_token/generate_permission_token_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/generate_permission_token/generate_permission_token_response.dart';

extension GeneratePermissionTokenResponseMapper
    on GeneratePermissionTokenResponseDto {
  GeneratePermissionTokenResponse concertGeneratePermissionTokenResponse() {
    return GeneratePermissionTokenResponse(
      accessType: accessType,
      code: code,
      entityType: entityType,
      expiresAt: expiresAt,
      tokenId: tokenId,
    );
  }
}
