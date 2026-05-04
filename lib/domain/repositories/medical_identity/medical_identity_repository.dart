import 'dart:typed_data';
import 'package:sijil_patient_portal/domain/entities/medical_identity/request/add_emergency_contact/add_emergency_contact_request.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/request/upload_profile_image/upload_profile_image_request.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/add_emergency_contact/add_emergency_contact_response.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/delete_emergency_contact/delete_emergency_contact_response.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/get_medical_identity/get_medical_identity_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/upload_profile_image/upload_profile_image_response.dart';

abstract class MedicalIdentityRepository {
  Future<UploadProfileImageResponse> uploadProfileImage(
    UploadProfileImageRequest uploadProfileImageRequest,
  );

  Future<Uint8List> getProfileImage();

  Future<AddEmergencyContactResponse> addEmergencyContact({
    required AddEmergencyContactRequest addEmergencyContactRequest,
  });

  Future<GetMedicalIdentityResponse> getMedicalIdentity();

  Future<DeleteEmergencyContactResponse> deleteEmergencyContact({
    required String contactId,
  });
}
