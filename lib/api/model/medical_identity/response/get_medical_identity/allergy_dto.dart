import 'package:json_annotation/json_annotation.dart';

part 'allergy_dto.g.dart';

@JsonSerializable()
class AllergyDto {
  String? allergenName;
  String? icd11Title;
  String? severity;
  String? reactionDescription;
  String? diagnosedBy;
  DateTime? diagnosedDate;

  AllergyDto({
    this.allergenName,
    this.icd11Title,
    this.severity,
    this.reactionDescription,
    this.diagnosedBy,
    this.diagnosedDate,
  });

  factory AllergyDto.fromJson(Map<String, dynamic> json) {
    return _$AllergyDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AllergyDtoToJson(this);
}
