import 'package:sijil_patient_portal/api/model/medical_identity/request/add_emergency_contact/add_emergency_contact_request_dto.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/request/add_emergency_contact/add_emergency_contact_request.dart';

extension AddEmergencyContactRequestMapper on AddEmergencyContactRequest {
  AddEmergencyContactRequestDto converToAddEmergencyContactRequestDto() {
    return AddEmergencyContactRequestDto(
      contactName: contactName,
      phoneNumber: phoneNumber,
      isPrimary: isPrimary,
      relationship: relationship,
    );
  }
}
