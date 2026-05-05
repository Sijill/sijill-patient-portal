import 'package:json_annotation/json_annotation.dart';

part 'diagnosis_note_dto.g.dart';

@JsonSerializable()
class DiagnosisNoteDto {
  String? diagnosisId;
  String? icd11Code;
  String? icd11Title;
  bool? isChronic;
  String? status;

  DiagnosisNoteDto({
    this.diagnosisId,
    this.icd11Code,
    this.icd11Title,
    this.isChronic,
    this.status,
  });

  factory DiagnosisNoteDto.fromJson(Map<String, dynamic> json) {
    return _$DiagnosisNoteDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DiagnosisNoteDtoToJson(this);
}
