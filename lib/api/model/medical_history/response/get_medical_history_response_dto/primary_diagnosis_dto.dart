import 'package:json_annotation/json_annotation.dart';

part 'primary_diagnosis_dto.g.dart';

@JsonSerializable()
class PrimaryDiagnosisDto {
  String? icd11Code;
  String? icd11Title;

  PrimaryDiagnosisDto({this.icd11Code, this.icd11Title});

  factory PrimaryDiagnosisDto.fromJson(Map<String, dynamic> json) {
    return _$PrimaryDiagnosisDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PrimaryDiagnosisDtoToJson(this);
}
