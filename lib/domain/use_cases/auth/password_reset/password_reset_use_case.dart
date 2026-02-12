import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/password_reset/password_reset_response.dart';
import 'package:sijil_patient_portal/domain/repositories/auth/auth_repository.dart';

@injectable
class PasswordResetUseCase {
  AuthRepository authRepository;
  PasswordResetUseCase({required this.authRepository});
  Future<PasswordResetResponse> invoke({
    required PasswordResetRequest passwordResetRequest,
  }) {
    return authRepository.passwordReset(passwordResetRequest);
  }
}
