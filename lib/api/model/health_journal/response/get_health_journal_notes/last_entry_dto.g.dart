// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_entry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LastEntryDto _$LastEntryDtoFromJson(Map<String, dynamic> json) => LastEntryDto(
  patientOutcome: json['patientOutcome'] as String?,
  painLevel: (json['painLevel'] as num?)?.toInt(),
  energyLevel: (json['energyLevel'] as num?)?.toInt(),
  mood: json['mood'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$LastEntryDtoToJson(LastEntryDto instance) =>
    <String, dynamic>{
      'patientOutcome': instance.patientOutcome,
      'painLevel': instance.painLevel,
      'energyLevel': instance.energyLevel,
      'mood': instance.mood,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
