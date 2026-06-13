import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/data/data_sources/remote/permission_token/permission_token_data_sources.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/request/generate_permission_token/generate_permission_token_request.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/generate_permission_token/generate_permission_token_response.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/get_permission_token/get_permission_token_response.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/permission_token_revoke/permission_token_revoke_response.dart';
import 'package:sijil_patient_portal/domain/repositories/permission_token/permission_token_repository.dart';

@Injectable(as: PermissionTokenRepository)
class PermissionTokenRepositoryImpl implements PermissionTokenRepository {
  PermissionTokenDataSources permissionTokenDataSources;
  PermissionTokenRepositoryImpl({required this.permissionTokenDataSources});
  @override
  Future<GeneratePermissionTokenResponse> generatePermissionToken({
    required GeneratePermissionTokenRequest generatePermissionTokenRequest,
  }) {
    return permissionTokenDataSources.generatePermissionToken(
      generatePermissionTokenRequest: generatePermissionTokenRequest,
    );
  }

  @override
  Future<GetPermissionTokenResponse> getPermissionToken() {
    return permissionTokenDataSources.getPermissionToken();
  }

  @override
  Future<PermissionTokenRevokeResponse> permissionTokenRevoke({
    required String tokenId,
  }) {
    return permissionTokenDataSources.permissionTokenRevoke(tokenId: tokenId);
  }
}
