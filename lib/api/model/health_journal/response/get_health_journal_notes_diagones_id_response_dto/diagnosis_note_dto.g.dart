// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosis_note_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiagnosisNoteDto _$DiagnosisNoteDtoFromJson(Map<String, dynamic> json) =>
    DiagnosisNoteDto(
      diagnosisId: json['diagnosisId'] as String?,
      icd11Code: json['icd11Code'] as String?,
      icd11Title: json['icd11Title'] as String?,
      isChronic: json['isChronic'] as bool?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$DiagnosisNoteDtoToJson(DiagnosisNoteDto instance) =>
    <String, dynamic>{
      'diagnosisId': instance.diagnosisId,
      'icd11Code': instance.icd11Code,
      'icd11Title': instance.icd11Title,
      'isChronic': instance.isChronic,
      'status': instance.status,
    };
