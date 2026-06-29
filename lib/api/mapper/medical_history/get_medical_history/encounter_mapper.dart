import 'package:sijil_patient_portal/api/mapper/medical_history/get_medical_history/diagnoses_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/medical_history/get_medical_history/prescribed_medications_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/medical_history/get_medical_history/primary_diagnosis_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/medical_history/get_medical_history/symptoms_and_complaints_mapper.dart';
import 'package:sijil_patient_portal/api/model/medical_history/response/get_medical_history_response_dto/encounter_dto.dart';
import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_medical_history_response/encounter.dart';

extension EncounterMapper on EncounterDto {
  Encounter convertToEncounter() {
    return Encounter(
      diagnoses: diagnoses?.map((e) => e.convertToDiagnosis()).toList(),
      doctorName: doctorName,
      doctorSpeciality: doctorSpeciality,
      encounterDate: encounterDate,
      encounterId: encounterId,
      location: location,
      prescribedMedications: prescribedMedications
          ?.map((e) => e.convertToPrescribedMedication())
          .toList(),
      primaryDiagnosis: primaryDiagnosis?.convertToPrimaryDiagnosis(),
      symptomsAndComplaints: symptomsAndComplaints
          ?.map((e) => e.convertToSymptomsAndComplaints())
          .toList(),
    );
  }
}
