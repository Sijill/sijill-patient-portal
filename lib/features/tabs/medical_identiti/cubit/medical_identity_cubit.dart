import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/core/exceptions/app_exception.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/request/add_emergency_contact/add_emergency_contact_request.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/request/upload_profile_image/upload_profile_image_request.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/get_medical_identity/get_medical_identity_response_dto.dart';
import 'package:sijil_patient_portal/domain/use_cases/medical_identity/add_emergency_contact_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/medical_identity/get_medical_identity_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/medical_identity/get_profile_image_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/medical_identity/upload_profile_image_use_case.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/cubit/medical_identity_state.dart';
import 'package:intl/intl.dart';

@injectable
class MedicalIdentityCubit extends Cubit<MedicalIdentityState> {
  UploadProfileImageUseCase uploadProfileImageUseCase;
  GetProfileImageUseCase getProfileImageUseCase;
  AddEmergencyContactUseCase addEmergencyContactUseCase;
  GetMedicalIdentityUseCase getMedicalIdentityUseCase;
  MedicalIdentityCubit({
    required this.uploadProfileImageUseCase,
    required this.getProfileImageUseCase,
    required this.addEmergencyContactUseCase,
    required this.getMedicalIdentityUseCase,
  }) : super(MedicalIdentityInitial());
  GetMedicalIdentityResponse? cubit;
  bool selectItem = false;
  File? selectedImage;
  Uint8List? imageBytes;
  void toggleSelectItem() {
    selectItem = !selectItem;
    emit(MedicalIdentityChangeSelectItem());
  }

  void uploadProfileImage(
    UploadProfileImageRequest uploadProfileImageRequest,
  ) async {
    emit(UploadProfileImageLoading());
    try {
      final uploadProfileImageResponse = await uploadProfileImageUseCase.invoke(
        uploadProfileImageRequest,
      );
      emit(
        UploadProfileImageSuccess(
          uploadProfileImageResponse: uploadProfileImageResponse,
        ),
      );
    } on AppException catch (e) {
      emit(UploadProfileImageError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(UploadProfileImageError(message: message));
    } catch (e) {
      emit(UploadProfileImageError(message: e.toString()));
    }
  }

  void getProfileImage() async {
    emit(GetProfileImageLoading());
    try {
      final profileImageBytes = await getProfileImageUseCase.invoke();
      imageBytes = profileImageBytes;
      emit(GetProfileImageSuccess(imageBytes: profileImageBytes));
    } on AppException catch (e) {
      emit(GetProfileImageError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(GetProfileImageError(message: message));
    } catch (e) {
      emit(GetProfileImageError(message: e.toString()));
    }
  }

  void changeSelectedImage(File? image) {
    selectedImage = image;
    emit(ChangeSelectedImage());
  }

  void addEmergencyContact(
    AddEmergencyContactRequest addEmergencyContactRequest,
  ) async {
    emit(AddEmergencyContactLoading());
    try {
      final addEmergencyContactResponse = await addEmergencyContactUseCase
          .invoke(addEmergencyContactRequest: addEmergencyContactRequest);
      emit(
        AddEmergencyContactSuccess(
          addEmergencyContactResponse: addEmergencyContactResponse,
        ),
      );
    } on AppException catch (e) {
      emit(AddEmergencyContactError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(AddEmergencyContactError(message: message));
    } catch (e) {
      emit(AddEmergencyContactError(message: e.toString()));
    }
  }

  void getMedicalIdentity() async {
    emit(GetMedicalIdentityLoading());
    try {
      final getMedicalIdentityResponse = await getMedicalIdentityUseCase
          .invoke();
      cubit = getMedicalIdentityResponse;
      emit(GetMedicalIdentitySuccess());
    } on AppException catch (e) {
      emit(GetMedicalIdentityError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(GetMedicalIdentityError(message: message));
    } catch (e) {
      emit(GetMedicalIdentityError(message: e.toString()));
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return "Not specified";
    return DateFormat('MMM yyyy').format(date).toUpperCase();
  }
}
