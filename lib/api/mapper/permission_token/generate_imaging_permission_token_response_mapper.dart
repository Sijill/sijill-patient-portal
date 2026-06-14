import 'package:sijil_patient_portal/api/model/permission_token/response/generate_imaging_permission_token_response/generate_imaging_permission_token_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/generate_imaging_permission_token_response/generate_imaging_permission_token_response.dart';

extension GenerateImagingPermissionTokenResponseMapper
    on GenerateImagingPermissionTokenResponseDto {
  GenerateImagingPermissionTokenResponse
  convertToGenerateImagingPermissionTokenResponse() {
    return GenerateImagingPermissionTokenResponse(
      accessType: accessType,
      code: code,
      entityType: entityType,
      medicalOrderId: medicalOrderId,
      expiresAt: expiresAt,
      tokenId: tokenId,
    );
  }
}
