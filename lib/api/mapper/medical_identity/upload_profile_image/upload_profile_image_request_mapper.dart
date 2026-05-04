import 'package:sijil_patient_portal/api/model/medical_identity/request/upload_profile_image/upload_profile_image_request_dto.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/request/upload_profile_image/upload_profile_image_request.dart';

extension UploadProfileImageRequestMapper on UploadProfileImageRequest {
  UploadProfileImageRequestDto converToUploadProfileImageRequestDto() {
    return UploadProfileImageRequestDto(profilePicture: profilePicture);
  }
}
