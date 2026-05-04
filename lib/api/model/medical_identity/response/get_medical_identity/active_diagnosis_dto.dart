import 'package:json_annotation/json_annotation.dart';

part 'active_diagnosis_dto.g.dart';

@JsonSerializable()
class ActiveDiagnosisDto {
  String? diagnosisId;
  String? icd11Title;
  String? icd11Code;
  String? diagnosedBy;
  DateTime? diagnosedDate;

  ActiveDiagnosisDto({
    this.diagnosisId,
    this.icd11Title,
    this.icd11Code,
    this.diagnosedBy,
    this.diagnosedDate,
  });

  factory ActiveDiagnosisDto.fromJson(Map<String, dynamic> json) {
    return _$ActiveDiagnosisDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ActiveDiagnosisDtoToJson(this);
}
