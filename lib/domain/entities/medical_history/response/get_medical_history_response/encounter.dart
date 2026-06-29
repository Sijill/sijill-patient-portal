import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_medical_history_response/diagnosis.dart';
import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_medical_history_response/prescribed_medication.dart';
import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_medical_history_response/primary_diagnosis.dart';
import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_medical_history_response/symptoms_and_complaints.dart';

class Encounter {
  String? encounterId;
  String? doctorName;
  String? doctorSpeciality;
  DateTime? encounterDate;
  String? location;
  PrimaryDiagnosis? primaryDiagnosis;
  List<SymptomsAndComplaints>? symptomsAndComplaints;
  List<Diagnosis>? diagnoses;
  List<PrescribedMedication>? prescribedMedications;

  Encounter({
    this.encounterId,
    this.doctorName,
    this.doctorSpeciality,
    this.encounterDate,
    this.location,
    this.primaryDiagnosis,
    this.symptomsAndComplaints,
    this.diagnoses,
    this.prescribedMedications,
  });
}
