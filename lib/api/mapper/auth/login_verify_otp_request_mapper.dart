import 'package:sijil_patient_portal/api/model/auth/request/login/login_verfiy_otp_request_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/login/login_verfiy_otp_request.dart';

extension LoginVerifyOtpRequestMapper on LoginVerfiyOtpRequest {
  LoginVerfiyOtpRequestDto convertToLoginVerfiyOtpRequestDto() {
    return LoginVerfiyOtpRequestDto(loginSessionId: loginSessionId, otp: otp);
  }
}
