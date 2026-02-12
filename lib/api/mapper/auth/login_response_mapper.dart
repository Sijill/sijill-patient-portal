import 'package:sijil_patient_portal/api/model/auth/response/login/login_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/login/login_response.dart';

extension LoginResponseMapper on LoginResponseDto {
  LoginResponse cnvertToLoginResponse() {
    return LoginResponse(
      expiresAt: expiresAt,
      loginSessionId: loginSessionId,
      otpDelivery: otpDelivery,
    );
  }
}
