import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/core/exceptions/app_exception.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/request/upload_profile_image/upload_profile_image_request.dart';
import 'package:sijil_patient_portal/domain/use_cases/medical_identity/get_profile_image_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/medical_identity/upload_profile_image_use_case.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/cubit/medical_identity_state.dart';

@injectable
class MedicalIdentityCubit extends Cubit<MedicalIdentityState> {
  UploadProfileImageUseCase uploadProfileImageUseCase;
  GetProfileImageUseCase getProfileImageUseCase;
  MedicalIdentityCubit({
    required this.uploadProfileImageUseCase,
    required this.getProfileImageUseCase,
  }) : super(MedicalIdentityInitial());

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
}
