import 'package:sijil_patient_portal/api/model/auth/request/login/login_request_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/login/login_request.dart';

extension LoginRequestMapper on LoginRequest {
  LoginRequestDto convertToLoginRequestDto() {
    return LoginRequestDto(email: email, password: password);
  }
}
