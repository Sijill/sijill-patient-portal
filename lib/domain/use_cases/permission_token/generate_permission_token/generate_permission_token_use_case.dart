import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/request/generate_permission_token/generate_permission_token_request.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/generate_permission_token/generate_permission_token_response.dart';

import 'package:sijil_patient_portal/domain/repositories/permission_token/permission_token_repository.dart';

@injectable
class GeneratePermissionTokenUseCase {
  PermissionTokenRepository permissionTokenRepository;
  GeneratePermissionTokenUseCase({required this.permissionTokenRepository});
  Future<GeneratePermissionTokenResponse> invoke({
    required GeneratePermissionTokenRequest generatePermissionTokenRequest,
  }) {
    return permissionTokenRepository.generatePermissionToken(
      generatePermissionTokenRequest: generatePermissionTokenRequest,
    );
  }
}
