// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_diagnosis_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveDiagnosisDto _$ActiveDiagnosisDtoFromJson(Map<String, dynamic> json) =>
    ActiveDiagnosisDto(
      diagnosisId: json['diagnosisId'] as String?,
      icd11Title: json['icd11Title'] as String?,
      icd11Code: json['icd11Code'] as String?,
      diagnosedBy: json['diagnosedBy'] as String?,
      diagnosedDate: json['diagnosedDate'] == null
          ? null
          : DateTime.parse(json['diagnosedDate'] as String),
    );

Map<String, dynamic> _$ActiveDiagnosisDtoToJson(ActiveDiagnosisDto instance) =>
    <String, dynamic>{
      'diagnosisId': instance.diagnosisId,
      'icd11Title': instance.icd11Title,
      'icd11Code': instance.icd11Code,
      'diagnosedBy': instance.diagnosedBy,
      'diagnosedDate': instance.diagnosedDate?.toIso8601String(),
    };
