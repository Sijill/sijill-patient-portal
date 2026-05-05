// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntryDto _$EntryDtoFromJson(Map<String, dynamic> json) => EntryDto(
  noteId: json['noteId'] as String?,
  patientId: json['patientId'] as String?,
  diagnosisId: json['diagnosisId'] as String?,
  noteDate: json['noteDate'] == null
      ? null
      : DateTime.parse(json['noteDate'] as String),
  patientOutcome: json['patientOutcome'] as String?,
  patientOutcomeDetails: json['patientOutcomeDetails'] as String?,
  mood: json['mood'] as String?,
  painLevel: (json['painLevel'] as num?)?.toInt(),
  energyLevel: (json['energyLevel'] as num?)?.toInt(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  diagnosis: json['diagnosis'] == null
      ? null
      : DiagnosisDto.fromJson(json['diagnosis'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EntryDtoToJson(EntryDto instance) => <String, dynamic>{
  'noteId': instance.noteId,
  'patientId': instance.patientId,
  'diagnosisId': instance.diagnosisId,
  'noteDate': instance.noteDate?.toIso8601String(),
  'patientOutcome': instance.patientOutcome,
  'patientOutcomeDetails': instance.patientOutcomeDetails,
  'mood': instance.mood,
  'painLevel': instance.painLevel,
  'energyLevel': instance.energyLevel,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'diagnosis': instance.diagnosis,
};
