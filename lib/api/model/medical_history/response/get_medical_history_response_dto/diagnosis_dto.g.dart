// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosis_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiagnosisDto _$DiagnosisDtoFromJson(Map<String, dynamic> json) => DiagnosisDto(
  icd11Code: json['icd11Code'] as String?,
  icd11Title: json['icd11Title'] as String?,
  clinicalDescription: json['clinicalDescription'] as String?,
);

Map<String, dynamic> _$DiagnosisDtoToJson(DiagnosisDto instance) =>
    <String, dynamic>{
      'icd11Code': instance.icd11Code,
      'icd11Title': instance.icd11Title,
      'clinicalDescription': instance.clinicalDescription,
    };
