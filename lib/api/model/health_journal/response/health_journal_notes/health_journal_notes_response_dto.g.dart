// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_journal_notes_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthJournalNotesResponseDto _$HealthJournalNotesResponseDtoFromJson(
  Map<String, dynamic> json,
) => HealthJournalNotesResponseDto(
  entry: json['entry'] == null
      ? null
      : EntryDto.fromJson(json['entry'] as Map<String, dynamic>),
  healthSnapshot: json['healthSnapshot'] == null
      ? null
      : HealthSnapshotDto.fromJson(
          json['healthSnapshot'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$HealthJournalNotesResponseDtoToJson(
  HealthJournalNotesResponseDto instance,
) => <String, dynamic>{
  'entry': instance.entry,
  'healthSnapshot': instance.healthSnapshot,
};
