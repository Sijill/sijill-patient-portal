import 'package:json_annotation/json_annotation.dart';

part 'diagnosis_dto.g.dart';

@JsonSerializable()
class DiagnosisDto {
  String? diagnosisId;
  String? icd11Code;
  String? icd11Title;
  String? clinicalDescription;
  bool? isChronic;
  String? diagnosedBy;
  DateTime? diagnosedDate;

  DiagnosisDto({
    this.diagnosisId,
    this.icd11Code,
    this.icd11Title,
    this.clinicalDescription,
    this.isChronic,
    this.diagnosedBy,
    this.diagnosedDate,
  });

  factory DiagnosisDto.fromJson(Map<String, dynamic> json) {
    return _$DiagnosisDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DiagnosisDtoToJson(this);
}
