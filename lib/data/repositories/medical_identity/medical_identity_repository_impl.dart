import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/data/data_sources/remote/medical_identity/medical_identity_data_sources.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/request/add_emergency_contact/add_emergency_contact_request.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/request/upload_profile_image/upload_profile_image_request.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/add_emergency_contact/add_emergency_contact_response.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/delete_emergency_contact/delete_emergency_contact_response.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/get_medical_identity/get_medical_identity_response_dto.dart';
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

  @override
  Future<AddEmergencyContactResponse> addEmergencyContact({
    required AddEmergencyContactRequest addEmergencyContactRequest,
  }) {
    return medicalIdentityDataSources.addEmergencyContact(
      addEmergencyContactRequest: addEmergencyContactRequest,
    );
  }

  @override
  Future<GetMedicalIdentityResponse> getMedicalIdentity() {
    return medicalIdentityDataSources.getMedicalIdentity();
  }

  @override
  Future<DeleteEmergencyContactResponse> deleteEmergencyContact({
    required String contactId,
  }) {
    return medicalIdentityDataSources.deleteEmergencyContact(
      contactId: contactId,
    );
  }
}
