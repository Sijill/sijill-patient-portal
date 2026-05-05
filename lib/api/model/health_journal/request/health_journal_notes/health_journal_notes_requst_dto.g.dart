// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_journal_notes_requst_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthJournalNotesRequstDto _$HealthJournalNotesRequstDtoFromJson(
  Map<String, dynamic> json,
) => HealthJournalNotesRequstDto(
  diagnosisId: json['diagnosisId'] as String?,
  patientOutcome: json['patientOutcome'] as String?,
  patientOutcomeDetails: json['patientOutcomeDetails'] as String?,
  painLevel: (json['painLevel'] as num?)?.toInt(),
  energyLevel: (json['energyLevel'] as num?)?.toInt(),
  mood: json['mood'] as String?,
);

Map<String, dynamic> _$HealthJournalNotesRequstDtoToJson(
  HealthJournalNotesRequstDto instance,
) => <String, dynamic>{
  'diagnosisId': instance.diagnosisId,
  'patientOutcome': instance.patientOutcome,
  'patientOutcomeDetails': instance.patientOutcomeDetails,
  'painLevel': instance.painLevel,
  'energyLevel': instance.energyLevel,
  'mood': instance.mood,
};
