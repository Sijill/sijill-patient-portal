import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_verify_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/register/register_verify_otp_response.dart';
import 'package:sijil_patient_portal/domain/repositories/auth/auth_repository.dart';

@injectable
class RegisterVerifyOtpUseCase {
  AuthRepository authRepository;
  RegisterVerifyOtpUseCase({required this.authRepository});
  Future<RegisterVerifyOtpResponse> invoke({
    RegisterVerifyOtpRequest? registerVerifyOtpRequest,
  }) {
    return authRepository.registerVerifyOtp(registerVerifyOtpRequest!);
  }
}
