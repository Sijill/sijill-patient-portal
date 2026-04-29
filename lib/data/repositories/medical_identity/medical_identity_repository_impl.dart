import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/data/data_sources/remote/medical_identity/medical_identity_data_sources.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/request/upload_profile_image/upload_profile_image_request.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/upload_profile_image/upload_profile_image_response.dart';
import 'package:sijil_patient_portal/domain/repositories/medical_identity/medical_identity_repository.dart';

@Injectable(as: MedicalIdentityRepository)
class MedicalIdentityRepositoryImpl implements MedicalIdentityRepository {
  MedicalIdentityDataSources medicalIdentityDataSources;
  MedicalIdentityRepositoryImpl({required this.medicalIdentityDataSources});
  @override
  Future<UploadProfileImageResponse> uploadProfileImage(
    UploadProfileImageRequest uploadProfileImageRequest,
  ) {
    return medicalIdentityDataSources.uploadProfileImage(
      uploadProfileImageRequest,
    );
  }

  @override
  Future<Uint8List> getProfileImage() {
    return medicalIdentityDataSources.getProfileImage();
  }
}
