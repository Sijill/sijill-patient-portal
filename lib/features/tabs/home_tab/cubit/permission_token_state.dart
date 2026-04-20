import 'package:sijil_patient_portal/domain/entities/permission_token/response/generate_permission_token/generate_permission_token_response.dart';

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
