// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosis_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiagnosisDto _$DiagnosisDtoFromJson(Map<String, dynamic> json) => DiagnosisDto(
  diagnosisId: json['diagnosisId'] as String?,
  icd11Code: json['icd11Code'] as String?,
  icd11Title: json['icd11Title'] as String?,
  clinicalDescription: json['clinicalDescription'] as String?,
  isChronic: json['isChronic'] as bool?,
  diagnosedBy: json['diagnosedBy'] as String?,
  diagnosedDate: json['diagnosedDate'] == null
      ? null
      : DateTime.parse(json['diagnosedDate'] as String),
);

Map<String, dynamic> _$DiagnosisDtoToJson(DiagnosisDto instance) =>
    <String, dynamic>{
      'diagnosisId': instance.diagnosisId,
      'icd11Code': instance.icd11Code,
      'icd11Title': instance.icd11Title,
      'clinicalDescription': instance.clinicalDescription,
      'isChronic': instance.isChronic,
      'diagnosedBy': instance.diagnosedBy,
      'diagnosedDate': instance.diagnosedDate?.toIso8601String(),
    };
