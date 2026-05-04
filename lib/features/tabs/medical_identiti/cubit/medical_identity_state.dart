import 'dart:typed_data';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/add_emergency_contact/add_emergency_contact_response.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/upload_profile_image/upload_profile_image_response.dart';

abstract class MedicalIdentityState {}

class MedicalIdentityInitial extends MedicalIdentityState {}

class MedicalIdentityChangeSelectItem extends MedicalIdentityState {}

class UploadProfileImageLoading extends MedicalIdentityState {}

class UploadProfileImageSuccess extends MedicalIdentityState {
  UploadProfileImageResponse uploadProfileImageResponse;
  UploadProfileImageSuccess({required this.uploadProfileImageResponse});
}

class UploadProfileImageError extends MedicalIdentityState {
  String? message;
  UploadProfileImageError({this.message});
}

class GetProfileImageLoading extends MedicalIdentityState {}

class GetProfileImageSuccess extends MedicalIdentityState {
  Uint8List imageBytes;
  GetProfileImageSuccess({required this.imageBytes});
}

class GetProfileImageError extends MedicalIdentityState {
  String? message;
  GetProfileImageError({this.message});
}

class ChangeSelectedImage extends MedicalIdentityState {}

class AddEmergencyContactLoading extends MedicalIdentityState {}

class AddEmergencyContactSuccess extends MedicalIdentityState {
  AddEmergencyContactResponse addEmergencyContactResponse;
  AddEmergencyContactSuccess({required this.addEmergencyContactResponse});
}

class AddEmergencyContactError extends MedicalIdentityState {
  String? message;
  AddEmergencyContactError({this.message});
}

class GetMedicalIdentityLoading extends MedicalIdentityState {}

class GetMedicalIdentitySuccess extends MedicalIdentityState {}

class GetMedicalIdentityError extends MedicalIdentityState {
  String? message;
  GetMedicalIdentityError({this.message});
}
