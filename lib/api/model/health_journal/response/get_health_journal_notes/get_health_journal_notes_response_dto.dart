import 'package:json_annotation/json_annotation.dart';

import 'diagnosis_dto.dart';

part 'get_health_journal_notes_response_dto.g.dart';

@JsonSerializable()
class GetHealthJournalNotesResponseDto {
  List<DiagnosisDto>? diagnoses;

  GetHealthJournalNotesResponseDto({this.diagnoses});

  factory GetHealthJournalNotesResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetHealthJournalNotesResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetHealthJournalNotesResponseDtoToJson(this);
  }
}
