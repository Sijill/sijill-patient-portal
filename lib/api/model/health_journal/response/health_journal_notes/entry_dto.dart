import 'package:json_annotation/json_annotation.dart';

import 'diagnosis_dto.dart';

part 'entry_dto.g.dart';

@JsonSerializable()
class EntryDto {
  String? noteId;
  String? patientId;
  String? diagnosisId;
  DateTime? noteDate;
  String? patientOutcome;
  String? patientOutcomeDetails;
  String? mood;
  int? painLevel;
  int? energyLevel;
  DateTime? createdAt;
  DateTime? updatedAt;
  DiagnosisDto? diagnosis;

  EntryDto({
    this.noteId,
    this.patientId,
    this.diagnosisId,
    this.noteDate,
    this.patientOutcome,
    this.patientOutcomeDetails,
    this.mood,
    this.painLevel,
    this.energyLevel,
    this.createdAt,
    this.updatedAt,
    this.diagnosis,
  });

  factory EntryDto.fromJson(Map<String, dynamic> json) =>
      _$EntryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EntryDtoToJson(this);
}
