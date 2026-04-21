import 'package:sijil_patient_portal/api/model/permission_token/request/generate_permission_token/generate_permission_token_request_dto.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/request/generate_permission_token/generate_permission_token_request.dart';

extension GeneratePermissionTokenRequestMapper
    on GeneratePermissionTokenRequest {
  GeneratePermissionTokenRequestDto
  convertToGeneratePermissionTokenRequestDto() {
    return GeneratePermissionTokenRequestDto(
      accessType: accessType,
      entityType: entityType,
      expiresInMinutes: expiresInMinutes,
    );
  }
}
