import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/login/login_verfiy_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/login/login_verify_otp_response.dart';
import 'package:sijil_patient_portal/domain/repositories/auth/auth_repository.dart';

@injectable
class LoginVerifyOtpUseCase {
  AuthRepository authRepository;
  LoginVerifyOtpUseCase({required this.authRepository});
  Future<LoginVerifyOtpResponse> invoke(
    LoginVerfiyOtpRequest loginVerfiyOtpRequest,
  ) {
    return authRepository.loginVerifyOtp(loginVerfiyOtpRequest);
  }
}
