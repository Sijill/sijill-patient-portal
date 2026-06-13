import 'package:sijil_patient_portal/api/model/permission_token/response/generate_lab_permission_token_response/generate_lab_permission_token_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/generate_lab_permission_token_response/generate_lab_permission_token_response.dart';

extension GenerateLapPermissionTokenResponseMapper
    on GenerateLabPermissionTokenResponseDto {
  GenerateLabPermissionTokenResponse
  convertToGenerateLabPermissionTokenResponse() {
    return GenerateLabPermissionTokenResponse(
      accessType: accessType,
      code: code,
      entityType: entityType,
      medicalOrderId: medicalOrderId,
      expiresAt: expiresAt,
      tokenId: tokenId,
    );
  }
}
