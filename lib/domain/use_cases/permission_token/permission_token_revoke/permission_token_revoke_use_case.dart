import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/request/permission_token_revoke/permission_token_revoke_request.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/permission_token_revoke/permission_token_revoke_response.dart';
import 'package:sijil_patient_portal/domain/repositories/permission_token/permission_token_repository.dart';

@injectable
class PermissionTokenRevokeUseCase {
  PermissionTokenRepository permissionTokenRepository;
  PermissionTokenRevokeUseCase({required this.permissionTokenRepository});
  Future<PermissionTokenRevokeResponse> invoke({
    required PermissionTokenRevokeRequest permissionTokenRevokeRequest,
  }) {
    return permissionTokenRepository.permissionTokenRevoke(
      permissionTokenRevokeRequest: permissionTokenRevokeRequest,
    );
  }
}
