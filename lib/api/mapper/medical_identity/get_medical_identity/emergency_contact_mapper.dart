import 'package:sijil_patient_portal/api/model/medical_identity/response/get_medical_identity/emergency_contact_dto.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/get_medical_identity/emergency_contact.dart';

extension EmergencyContactMapper on EmergencyContactDto {
  EmergencyContact convertToEmergencyContact() {
    return EmergencyContact(
      contactName: contactName,
      isPrimary: isPrimary,
      phoneNumber: phoneNumber,
      relationship: relationship,
    );
  }
}
