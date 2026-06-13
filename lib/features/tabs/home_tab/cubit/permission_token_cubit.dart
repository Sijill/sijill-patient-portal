import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/core/exceptions/app_exception.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/request/generate_permission_token/generate_permission_token_request.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/get_permission_token/get_permission_token_response.dart';
import 'package:sijil_patient_portal/domain/use_cases/permission_token/generate_permission_token/generate_permission_token_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/permission_token/get_permission_token/get_permission_token_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/permission_token/permission_token_revoke/permission_token_revoke_use_case.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/permission_token_state.dart';

@injectable
class PermissionTokenCubit extends Cubit<PermissionTokenState> {
  GeneratePermissionTokenUseCase generatePermissionTokenUseCase;
  GetPermissionTokenUseCase getPermissionTokenUseCase;
  PermissionTokenRevokeUseCase permissionTokenRevokeUseCase;
  PermissionTokenCubit({
    required this.generatePermissionTokenUseCase,
    required this.getPermissionTokenUseCase,
    required this.permissionTokenRevokeUseCase,
  }) : super(PermissionTokenInitial());

  GetPermissionTokenResponse? getPermissionTokenResponse;

  int selectedAccessType = 0;
  String getAccessTypeValue() {
    switch (selectedAccessType) {
      case 0:
        return "READ_WRITE";
      case 1:
        return "READ_ONLY";
      case 2:
        return "WRITE_ONLY";
      default:
        return "READ_ONLY";
    }
  }

  void selectAccessType(int index) {
    selectedAccessType = index;
    emit(SelectAccessClickSuccessState());
  }

  void resetGrantAccess() {
    selectedAccessType = 0;
    emit(PermissionTokenInitial());
  }

  Future<void> generatePermissionToken({
    required GeneratePermissionTokenRequest generatePermissionTokenRequest,
  }) async {
    try {
      emit(GeneratePermissionTokenILoading());
      final generatePermissionTokenResponse =
          await generatePermissionTokenUseCase.invoke(
            generatePermissionTokenRequest: generatePermissionTokenRequest,
          );
      emit(
        GeneratePermissionTokenSuccess(
          generatePermissionTokenResponse: generatePermissionTokenResponse,
        ),
      );
    } on AppException catch (e) {
      emit(GeneratePermissionTokenError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(GeneratePermissionTokenError(message: message));
    } catch (e) {
      emit(GeneratePermissionTokenError(message: e.toString()));
    }
  }

  Future<void> getPermissionToken() async {
    emit(GetPermissionTokenILoading());
    try {
      getPermissionTokenResponse = await getPermissionTokenUseCase.invoke();
      emit(
        GetPermissionTokenSuccess(
          getPermissionTokenResponse: getPermissionTokenResponse!,
        ),
      );
    } on AppException catch (e) {
      emit(GetPermissionTokenError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(GetPermissionTokenError(message: message));
    } catch (e) {
      emit(GetPermissionTokenError(message: e.toString()));
    }
  }

  Future<void> permissionRevokeToken({required String tokenId}) async {
    try {
      emit(PermissionTokenRevokeILoading());
      final permissionTokenRevokeResponse = await permissionTokenRevokeUseCase
          .invoke(tokenId: tokenId);
      emit(
        PermissionTokenRevokeSuccess(
          permissionTokenRevokeResponse: permissionTokenRevokeResponse,
        ),
      );
    } on AppException catch (e) {
      emit(PermissionTokenRevokeError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(PermissionTokenRevokeError(message: message));
    } catch (e) {
      emit(PermissionTokenRevokeError(message: e.toString()));
    }
  }
}
