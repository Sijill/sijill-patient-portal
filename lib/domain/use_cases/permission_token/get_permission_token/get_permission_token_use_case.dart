import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/get_permission_token/get_permission_token_response.dart';

import 'package:sijil_patient_portal/domain/repositories/permission_token/permission_token_repository.dart';

@injectable
class GetPermissionTokenUseCase {
  PermissionTokenRepository permissionTokenRepository;
  GetPermissionTokenUseCase({required this.permissionTokenRepository});
  Future<GetPermissionTokenResponse> invoke() {
    return permissionTokenRepository.getPermissionToken();
  }
}
