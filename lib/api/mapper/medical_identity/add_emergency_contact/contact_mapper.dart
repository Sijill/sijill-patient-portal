import 'package:sijil_patient_portal/api/model/medical_identity/response/add_emergency_contact/contact.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/add_emergency_contact/contact_entity.dart';

extension ContactMapper on Contact {
  ContactEntity convertToContactEntity() {
    return ContactEntity(
      contactName: contactName,
      isPrimary: isPrimary,
      phoneNumber: phoneNumber,
      relationship: relationship,
    );
  }
}
