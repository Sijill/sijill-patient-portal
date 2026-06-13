import 'package:sijil_patient_portal/domain/entities/permission_token/request/generate_permission_token/generate_permission_token_request.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/generate_permission_token/generate_permission_token_response.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/get_permission_token/get_permission_token_response.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/permission_token_revoke/permission_token_revoke_response.dart';

abstract class PermissionTokenDataSources {
  Future<GeneratePermissionTokenResponse> generatePermissionToken({
    required GeneratePermissionTokenRequest generatePermissionTokenRequest,
  });

  Future<GetPermissionTokenResponse> getPermissionToken();

  Future<PermissionTokenRevokeResponse> permissionTokenRevoke({
    required String tokenId,
  });
}
