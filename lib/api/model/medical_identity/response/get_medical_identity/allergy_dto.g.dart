// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allergy_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllergyDto _$AllergyDtoFromJson(Map<String, dynamic> json) => AllergyDto(
  allergenName: json['allergenName'] as String?,
  icd11Title: json['icd11Title'] as String?,
  severity: json['severity'] as String?,
  reactionDescription: json['reactionDescription'] as String?,
  diagnosedBy: json['diagnosedBy'] as String?,
  diagnosedDate: json['diagnosedDate'] == null
      ? null
      : DateTime.parse(json['diagnosedDate'] as String),
);

Map<String, dynamic> _$AllergyDtoToJson(AllergyDto instance) =>
    <String, dynamic>{
      'allergenName': instance.allergenName,
      'icd11Title': instance.icd11Title,
      'severity': instance.severity,
      'reactionDescription': instance.reactionDescription,
      'diagnosedBy': instance.diagnosedBy,
      'diagnosedDate': instance.diagnosedDate?.toIso8601String(),
    };
