import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/request/upload_profile_image/upload_profile_image_request.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/upload_profile_image/upload_profile_image_response.dart';
import 'package:sijil_patient_portal/domain/repositories/medical_identity/medical_identity_repository.dart';

@injectable
class UploadProfileImageUseCase {
  MedicalIdentityRepository medicalIdentityRepository;
  UploadProfileImageUseCase({required this.medicalIdentityRepository});
  Future<UploadProfileImageResponse> invoke(
    UploadProfileImageRequest uploadProfileImageRequest,
  ) {
    return medicalIdentityRepository.uploadProfileImage(
      uploadProfileImageRequest,
    );
  }
}
