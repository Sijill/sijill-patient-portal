import 'package:sijil_patient_portal/domain/entities/permission_token/response/generate_permission_token/generate_permission_token_response.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/get_permission_token/get_permission_token_response.dart';
import 'package:sijil_patient_portal/domain/entities/permission_token/response/permission_token_revoke/permission_token_revoke_response.dart';

abstract class PermissionTokenState {}

class PermissionTokenInitial extends PermissionTokenState {}

class SelectAccessClickSuccessState extends PermissionTokenState {}

class GeneratePermissionTokenILoading extends PermissionTokenState {}

class GeneratePermissionTokenSuccess extends PermissionTokenState {
  GeneratePermissionTokenResponse generatePermissionTokenResponse;
  GeneratePermissionTokenSuccess({
    required this.generatePermissionTokenResponse,
  });
}

class GeneratePermissionTokenError extends PermissionTokenState {
  String message;

  GeneratePermissionTokenError({required this.message});
}

class GetPermissionTokenILoading extends PermissionTokenState {}

class GetPermissionTokenSuccess extends PermissionTokenState {
  GetPermissionTokenResponse getPermissionTokenResponse;
  GetPermissionTokenSuccess({required this.getPermissionTokenResponse});
}

class GetPermissionTokenError extends PermissionTokenState {
  String message;

  GetPermissionTokenError({required this.message});
}

class PermissionTokenRevokeILoading extends PermissionTokenState {}

class PermissionTokenRevokeSuccess extends PermissionTokenState {
  PermissionTokenRevokeResponse permissionTokenRevokeResponse;
  PermissionTokenRevokeSuccess({required this.permissionTokenRevokeResponse});
}

class PermissionTokenRevokeError extends PermissionTokenState {
  String message;

  PermissionTokenRevokeError({required this.message});
}
