import 'package:json_annotation/json_annotation.dart';

part 'diagnosis_dto.g.dart';

@JsonSerializable()
class DiagnosisDto {
  String? icd11Code;
  String? icd11Title;
  String? clinicalDescription;

  DiagnosisDto({this.icd11Code, this.icd11Title, this.clinicalDescription});

  factory DiagnosisDto.fromJson(Map<String, dynamic> json) {
    return _$DiagnosisDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DiagnosisDtoToJson(this);
}
