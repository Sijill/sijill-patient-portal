import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/register/register_response.dart';
import 'package:sijil_patient_portal/domain/repositories/auth/auth_repository.dart';

@injectable
class RegisterUseCase {
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});
  Future<RegisterResponse> invoke({RegisterRequest? registerRequest}) {
    return authRepository.register(registerRequest!);
  }
}
