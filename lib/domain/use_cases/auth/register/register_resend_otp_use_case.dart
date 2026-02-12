import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_resend_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/register/register_resend_otp_response.dart';
import 'package:sijil_patient_portal/domain/repositories/auth/auth_repository.dart';

@injectable
class RegisterResendOtpUseCase {
  AuthRepository authRepository;
  RegisterResendOtpUseCase({required this.authRepository});
  Future<RegisterResendOtpResponse> invoke({
    RegisterResendOtpRequest? registerResendOtpRequest,
  }) {
    return authRepository.registerResendOtp(registerResendOtpRequest!);
  }
}
