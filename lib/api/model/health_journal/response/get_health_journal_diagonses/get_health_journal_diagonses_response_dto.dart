import 'package:json_annotation/json_annotation.dart';

import 'diagnosis_dto.dart';

part 'get_health_journal_diagonses_response_dto.g.dart';

@JsonSerializable()
class GetHealthJournalDiagonsesResponseDto {
  List<DiagnosisDto>? diagnoses;

  GetHealthJournalDiagonsesResponseDto({this.diagnoses});

  factory GetHealthJournalDiagonsesResponseDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GetHealthJournalDiagonsesResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetHealthJournalDiagonsesResponseDtoToJson(this);
  }
}
