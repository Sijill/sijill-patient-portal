// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chronic_condition_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChronicConditionDto _$ChronicConditionDtoFromJson(Map<String, dynamic> json) =>
    ChronicConditionDto(
      diagnosisId: json['diagnosisId'] as String?,
      icd11Title: json['icd11Title'] as String?,
      icd11Code: json['icd11Code'] as String?,
      diagnosedBy: json['diagnosedBy'] as String?,
      diagnosedDate: json['diagnosedDate'] == null
          ? null
          : DateTime.parse(json['diagnosedDate'] as String),
    );

Map<String, dynamic> _$ChronicConditionDtoToJson(
  ChronicConditionDto instance,
) => <String, dynamic>{
  'diagnosisId': instance.diagnosisId,
  'icd11Title': instance.icd11Title,
  'icd11Code': instance.icd11Code,
  'diagnosedBy': instance.diagnosedBy,
  'diagnosedDate': instance.diagnosedDate?.toIso8601String(),
};
