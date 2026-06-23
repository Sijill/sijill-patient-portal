import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/logout/logout_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/logout/logout_response.dart';
import 'package:sijil_patient_portal/domain/repositories/auth/auth_repository.dart';

@injectable
class LogoutUseCase {
  AuthRepository authRepository;
  LogoutUseCase({required this.authRepository});
  Future<LogoutResponse> invoke({required LogoutRequest logoutRequest}) {
    return authRepository.logout(logoutRequest);
  }
}
