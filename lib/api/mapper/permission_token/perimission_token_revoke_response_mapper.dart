import 'package:sijil_patient_portal/api/model/permission_token/response/permission_token_revoke/permission_token_revoke_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/permission_token_revoke/permission_token_revoke_response.dart';

extension PerimissionTokenRevokeResponseMapper
    on PermissionTokenRevokeResponseDto {
  PermissionTokenRevokeResponse convertToPermissionTokenRevokeResponse() {
    return PermissionTokenRevokeResponse(
      message: message,
      revokedAt: revokedAt,
      success: success,
      tokenId: tokenId,
    );
  }
}
