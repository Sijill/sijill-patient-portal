import 'package:json_annotation/json_annotation.dart';

part 'chronic_condition_dto.g.dart';

@JsonSerializable()
class ChronicConditionDto {
  String? diagnosisId;
  String? icd11Title;
  String? icd11Code;
  String? diagnosedBy;
  DateTime? diagnosedDate;

  ChronicConditionDto({
    this.diagnosisId,
    this.icd11Title,
    this.icd11Code,
    this.diagnosedBy,
    this.diagnosedDate,
  });

  factory ChronicConditionDto.fromJson(Map<String, dynamic> json) {
    return _$ChronicConditionDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChronicConditionDtoToJson(this);
}
