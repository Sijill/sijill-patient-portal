import 'package:sijil_patient_portal/api/model/auth/response/login/login_verify_otp_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/login/login_verify_otp_response.dart';

extension LoginVerifyOtpResponseMapper on LoginVerifyOtpResponseDto {
  LoginVerifyOtpResponse convertToLoginVerifyOtpResponse() {
    return LoginVerifyOtpResponse(
      accessToken: accessToken,
      email: email,
      message: message,
      role: role,
      refreshToken: refreshToken,
      success: success,
      userId: userId,
    );
  }
}
