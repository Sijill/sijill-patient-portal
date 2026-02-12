import 'package:sijil_patient_portal/api/model/auth/request/login/login_verify_otp_request_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/login/login_verfiy_otp_request.dart';

extension LoginVerifyOtpRequestMapper on LoginVerfiyOtpRequest {
  LoginVerifyOtpRequestDto convertToLoginVerifyOtpRequestDto() {
    return LoginVerifyOtpRequestDto(
      loginSessionId: loginSessionId,
      otp: otp,
      platform: platform,
    );
  }
}
