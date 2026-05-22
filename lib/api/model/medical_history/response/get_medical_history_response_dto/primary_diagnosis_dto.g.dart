// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'primary_diagnosis_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrimaryDiagnosisDto _$PrimaryDiagnosisDtoFromJson(Map<String, dynamic> json) =>
    PrimaryDiagnosisDto(
      icd11Code: json['icd11Code'] as String?,
      icd11Title: json['icd11Title'] as String?,
    );

Map<String, dynamic> _$PrimaryDiagnosisDtoToJson(
  PrimaryDiagnosisDto instance,
) => <String, dynamic>{
  'icd11Code': instance.icd11Code,
  'icd11Title': instance.icd11Title,
};
