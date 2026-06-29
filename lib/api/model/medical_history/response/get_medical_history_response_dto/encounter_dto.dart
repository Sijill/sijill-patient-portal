import 'package:json_annotation/json_annotation.dart';
import 'package:sijil_patient_portal/api/model/medical_history/response/get_medical_history_response_dto/symptoms_and_complaints_dto.dart';

import 'diagnosis_dto.dart';
import 'prescribed_medication_dto.dart';
import 'primary_diagnosis_dto.dart';

part 'encounter_dto.g.dart';

@JsonSerializable()
class EncounterDto {
  String? encounterId;
  String? doctorName;
  String? doctorSpeciality;
  DateTime? encounterDate;
  String? location;
  PrimaryDiagnosisDto? primaryDiagnosis;
  List<SymptomsAndComplaintsDto>? symptomsAndComplaints;
  List<DiagnosisDto>? diagnoses;
  List<PrescribedMedicationDto>? prescribedMedications;

  EncounterDto({
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

  factory EncounterDto.fromJson(Map<String, dynamic> json) {
    return _$EncounterDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EncounterDtoToJson(this);
}
