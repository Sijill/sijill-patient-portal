import 'package:json_annotation/json_annotation.dart';

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
  List<dynamic>? symptomsAndComplaints;
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
