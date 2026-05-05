import 'package:json_annotation/json_annotation.dart';

import 'diagnosis_note_dto.dart';
import 'note_dto.dart';

part 'get_health_journal_notes_diagones_id_response_dto.g.dart';

@JsonSerializable()
class GetHealthJournalNotesDiagonesIdResponseDto {
  DiagnosisNoteDto? diagnosis;
  List<NoteDto>? notes;

  GetHealthJournalNotesDiagonesIdResponseDto({this.diagnosis, this.notes});

  factory GetHealthJournalNotesDiagonesIdResponseDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GetHealthJournalNotesDiagonesIdResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetHealthJournalNotesDiagonesIdResponseDtoToJson(this);
  }
}
