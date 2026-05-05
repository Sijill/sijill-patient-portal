// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteDto _$NoteDtoFromJson(Map<String, dynamic> json) => NoteDto(
  noteId: json['noteId'] as String?,
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
);

Map<String, dynamic> _$NoteDtoToJson(NoteDto instance) => <String, dynamic>{
  'noteId': instance.noteId,
  'noteDate': instance.noteDate?.toIso8601String(),
  'patientOutcome': instance.patientOutcome,
  'patientOutcomeDetails': instance.patientOutcomeDetails,
  'mood': instance.mood,
  'painLevel': instance.painLevel,
  'energyLevel': instance.energyLevel,
  'createdAt': instance.createdAt?.toIso8601String(),
};
