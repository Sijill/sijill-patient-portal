import 'package:sijil_patient_portal/api/model/medical_identity/response/upload_profile_image/upload_profile_image_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/upload_profile_image/upload_profile_image_response.dart';

extension UploadProfileImageResponseMapper on UploadProfileImageResponseDto {
  UploadProfileImageResponse converToUploadProfileImageResponse() {
    return UploadProfileImageResponse(message: message, error: error);
  }
}
