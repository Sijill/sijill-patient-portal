import 'package:sijil_patient_portal/api/model/auth/request/register/register_request_dto.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_request.dart';

extension RegisterRequestMapper on RegisterRequest {
  RegisterRequestDto convertToRegisterRequest() {
    return RegisterRequestDto(
      dateOfBirth: dateOfBirth,
      email: email,
      firstName: firstName,
      gender: gender,
      middleName: middleName,
      nationalId: nationalId,
      nationalIdBack: nationalIdBack,
      nationalIdFront: nationalIdFront,
      password: password,
      phoneNumber: phoneNumber,
      role: role,
      selfieWithId: selfieWithId,
      surName: surName,
    );
  }
}
