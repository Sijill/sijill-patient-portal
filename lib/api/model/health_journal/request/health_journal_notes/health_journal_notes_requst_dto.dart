import 'package:json_annotation/json_annotation.dart';

part 'health_journal_notes_requst_dto.g.dart';

@JsonSerializable()
class HealthJournalNotesRequstDto {
  String? diagnosisId;
  String? patientOutcome;
  String? patientOutcomeDetails;
  int? painLevel;
  int? energyLevel;
  String? mood;

  HealthJournalNotesRequstDto({
    this.diagnosisId,
    this.patientOutcome,
    this.patientOutcomeDetails,
    this.painLevel,
    this.energyLevel,
    this.mood,
  });

  factory HealthJournalNotesRequstDto.fromJson(Map<String, dynamic> json) {
    return _$HealthJournalNotesRequstDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HealthJournalNotesRequstDtoToJson(this);
}
