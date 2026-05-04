import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/api/mapper/medical_identity/add_emergency_contact/add_emergency_contact_request_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/medical_identity/add_emergency_contact/add_emergency_contact_respomse_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/medical_identity/delete_emergency_contact/delete_emergency_contact_response_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/medical_identity/get_medical_identity/get_medical_identity_response_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/medical_identity/upload_profile_image/upload_profile_image_request_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/medical_identity/upload_profile_image/upload_profile_image_response_mapper.dart';
import 'package:sijil_patient_portal/api/web_service.dart';
import 'package:sijil_patient_portal/data/data_sources/remote/medical_identity/medical_identity_data_sources.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/request/add_emergency_contact/add_emergency_contact_request.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/request/upload_profile_image/upload_profile_image_request.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/add_emergency_contact/add_emergency_contact_response.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/delete_emergency_contact/delete_emergency_contact_response.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/get_medical_identity/get_medical_identity_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/upload_profile_image/upload_profile_image_response.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_compress_image.dart';

@Injectable(as: MedicalIdentityDataSources)
class MedicalIdentityDataSourcesImpl implements MedicalIdentityDataSources {
  WebService webservice;
  MedicalIdentityDataSourcesImpl({required this.webservice});
  @override
  Future<UploadProfileImageResponse> uploadProfileImage(
    UploadProfileImageRequest uploadProfileImageRequest,
  ) async {
    //todo: uploadProfileImageRequest => UploadProfileImageRequestDto
    final uploadProfileImageRequestDto = uploadProfileImageRequest
        .converToUploadProfileImageRequestDto();
    final compressedProfileImage = await CustomedCompressImage.compressImage(
      File(uploadProfileImageRequestDto.profilePicture!),
    );
    if (compressedProfileImage == null) {
      throw Exception("Failed to compress profile image");
    }
    final profilePicture = await MultipartFile.fromFile(
      compressedProfileImage.path,
      filename: 'profilePicture.jpeg',
    );
    //todo: uploadProfileImageResponse => UploadProfileImageResponseDto
    final uploadProfileImageResponse = await webservice.uploadProfileImage(
      profilePicture,
    );
    return uploadProfileImageResponse.converToUploadProfileImageResponse();
  }

  @override
  Future<Uint8List> getProfileImage() async {
    final profileImage = await webservice.getProfileImage();
    return Uint8List.fromList(profileImage.data);
  }

  @override
  Future<AddEmergencyContactResponse> addEmergencyContact({
    required AddEmergencyContactRequest addEmergencyContactRequest,
  }) async {
    //todo: addEmergencyContactResponset => addEmergencyContactResponsetDto
    final addEmergencyContactResponsetDto = await webservice
        .addEmergencyContact(
          addEmergencyContactRequest.converToAddEmergencyContactRequestDto(),
        );
    //todo: addEmergencyContactResponse => AddEmergencyContactResponseDto
    return addEmergencyContactResponsetDto
        .converToAddEmergencyContactResponse();
  }

  @override
  Future<GetMedicalIdentityResponse> getMedicalIdentity() async {
    //todo: GetMedicalIdentityResponseDto => GetMedicalIdentityResponse
    final getMedicalIdentityResponseDto = await webservice.getMedicalIdentity();
    return getMedicalIdentityResponseDto.convertToGetMedicalIdentityResponse();
  }

  @override
  Future<DeleteEmergencyContactResponse> deleteEmergencyContact({
    required String contactId,
  }) async {
    final deleteEmergencyContactResponseDto = await webservice
        .deleteEmergencyContact(contactId);
    //todo: DeleteEmergencyContactResponsetDto => DeleteEmergencyContactResponset
    return deleteEmergencyContactResponseDto
        .convertToDeleteEmergencyContactResponse();
  }
}
