import 'package:sijil_patient_portal/api/model/permission_token/request/permission_token_revoke/permission_token_revoke_request_dto.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/request/permission_token_revoke/permission_token_revoke_request.dart';

extension PermissionTokenRevokeRequestMapper on PermissionTokenRevokeRequest {
  PermissionTokenRevokeRequestDto convertTopermissionTokenRevokeRequestDto() {
    return PermissionTokenRevokeRequestDto(tokenId: tokenId);
  }
}
