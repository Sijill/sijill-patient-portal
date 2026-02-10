import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_confirm_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/password_reset/password_reset_confirm_response.dart';
import 'package:sijil_patient_portal/domain/repositories/auth/auth_repository.dart';

@injectable
class PasswordResetConfirmUseCase {
  AuthRepository authRepository;
  PasswordResetConfirmUseCase({required this.authRepository});
  Future<PasswordResetConfirmResponse> invoke(
    PasswordResetConfirmRequest passwordResetConfirmRequest,
  ) {
    return authRepository.passwordResetConfirm(passwordResetConfirmRequest);
  }
}
