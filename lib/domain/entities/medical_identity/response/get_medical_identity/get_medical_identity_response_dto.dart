import 'package:sijil_patient_portal/domain/entities/medical_identity/response/get_medical_identity/active_diagnosis.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/get_medical_identity/allergy.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/get_medical_identity/basic_info.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/get_medical_identity/chronic_condition.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/get_medical_identity/current_medication.dart';
import 'package:sijil_patient_portal/domain/entities/medical_identity/response/get_medical_identity/emergency_contact.dart';

class GetMedicalIdentityResponse {
  BasicInfo? basicInfo;
  List<ActiveDiagnosis>? activeDiagnoses;
  List<CurrentMedication>? currentMedications;
  List<Allergy>? allergies;
  List<ChronicCondition>? chronicConditions;
  List<EmergencyContact>? emergencyContacts;

  GetMedicalIdentityResponse({
    this.basicInfo,
    this.activeDiagnoses,
    this.currentMedications,
    this.allergies,
    this.chronicConditions,
    this.emergencyContacts,
  });
}
