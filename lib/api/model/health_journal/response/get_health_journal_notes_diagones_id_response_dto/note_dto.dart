import 'package:json_annotation/json_annotation.dart';

part 'note_dto.g.dart';

@JsonSerializable()
class NoteDto {
  String? noteId;
  DateTime? noteDate;
  String? patientOutcome;
  String? patientOutcomeDetails;
  String? mood;
  int? painLevel;
  int? energyLevel;
  DateTime? createdAt;

  NoteDto({
    this.noteId,
    this.noteDate,
    this.patientOutcome,
    this.patientOutcomeDetails,
    this.mood,
    this.painLevel,
    this.energyLevel,
    this.createdAt,
  });

  factory NoteDto.fromJson(Map<String, dynamic> json) =>
      _$NoteDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NoteDtoToJson(this);
}
