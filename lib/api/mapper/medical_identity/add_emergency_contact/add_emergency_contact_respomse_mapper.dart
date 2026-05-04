import 'package:sijil_patient_portal/api/mapper/medical_identity/add_emergency_contact/contact_mapper.dart';
import 'package:sijil_patient_portal/api/model/medical_identity/response/add_emergency_contact/add_emergency_contact_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/add_emergency_contact/add_emergency_contact_response.dart';

extension AddEmergencyContactRespomseMapper on AddEmergencyContactResponseDto {
  AddEmergencyContactResponse converToAddEmergencyContactResponse() {
    return AddEmergencyContactResponse(
      contactEntity: contact!.convertToContactEntity(),
    );
  }
}
