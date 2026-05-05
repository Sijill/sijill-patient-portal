import 'package:json_annotation/json_annotation.dart';

import 'last_entry_dto.dart';

part 'diagnosis_dto.g.dart';

@JsonSerializable()
class DiagnosisDto {
  String? diagnosisId;
  String? icd11Code;
  String? icd11Title;
  bool? isChronic;
  int? totalEntries;
  DateTime? lastEntryDate;
  LastEntryDto? lastEntry;

  DiagnosisDto({
    this.diagnosisId,
    this.icd11Code,
    this.icd11Title,
    this.isChronic,
    this.totalEntries,
    this.lastEntryDate,
    this.lastEntry,
  });

  factory DiagnosisDto.fromJson(Map<String, dynamic> json) {
    return _$DiagnosisDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DiagnosisDtoToJson(this);
}
