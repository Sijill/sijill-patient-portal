import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/login/login_resend_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/login/login_resend_otp_response.dart';
import 'package:sijil_patient_portal/domain/repositories/auth/auth_repository.dart';

@injectable
class LoginResendOtpUseCase {
  AuthRepository authRepository;
  LoginResendOtpUseCase({required this.authRepository});
  Future<LoginResendOtpResponse> invoke({
    required LoginResendOtpRequest loginResendOtpRequest,
  }) {
    return authRepository.loginResendOtp(loginResendOtpRequest);
  }
}
