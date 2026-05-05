// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosis_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiagnosisDto _$DiagnosisDtoFromJson(Map<String, dynamic> json) => DiagnosisDto(
  diagnosisId: json['diagnosisId'] as String?,
  icd11Code: json['icd11Code'] as String?,
  icd11Title: json['icd11Title'] as String?,
  isChronic: json['isChronic'] as bool?,
  totalEntries: (json['totalEntries'] as num?)?.toInt(),
  lastEntryDate: json['lastEntryDate'] == null
      ? null
      : DateTime.parse(json['lastEntryDate'] as String),
  lastEntry: json['lastEntry'] == null
      ? null
      : LastEntryDto.fromJson(json['lastEntry'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DiagnosisDtoToJson(DiagnosisDto instance) =>
    <String, dynamic>{
      'diagnosisId': instance.diagnosisId,
      'icd11Code': instance.icd11Code,
      'icd11Title': instance.icd11Title,
      'isChronic': instance.isChronic,
      'totalEntries': instance.totalEntries,
      'lastEntryDate': instance.lastEntryDate?.toIso8601String(),
      'lastEntry': instance.lastEntry,
    };
