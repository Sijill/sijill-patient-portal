import 'package:sijil_patient_portal/api/mapper/medical_identity/get_medical_identity/active_diagnoses_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/medical_identity/get_medical_identity/allergies_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/medical_identity/get_medical_identity/basic_info_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/medical_identity/get_medical_identity/chronic_condetions_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/medical_identity/get_medical_identity/current_medication_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/medical_identity/get_medical_identity/emergency_contact_mapper.dart';
import 'package:sijil_patient_portal/api/model/medical_identity/response/get_medical_identity/get_medical_identity_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/get_medical_identity/get_medical_identity_response_dto.dart';

extension GetMedicalIdentityResponseMapper on GetMedicalIdentityResponseDto {
  GetMedicalIdentityResponse convertToGetMedicalIdentityResponse() {
    return GetMedicalIdentityResponse(
      basicInfo: basicInfo!.convertToBasicInfo(),
      activeDiagnoses: activeDiagnoses
          ?.map((e) => e.converToActiveDiagnosis())
          .toList(),
      allergies: allergies!.map((e) => e.convertToAllergy()).toList(),
      chronicConditions: chronicConditions
          ?.map((e) => e.convertToChronicCondetions())
          .toList(),
      currentMedications: currentMedications
          ?.map((e) => e.convertToCurrentMedication())
          .toList(),
      emergencyContacts: emergencyContacts
          ?.map((e) => e.convertToEmergencyContact())
          .toList(),
    );
  }
}
