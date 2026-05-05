// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_health_journal_notes_diagones_id_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHealthJournalNotesDiagonesIdResponseDto
_$GetHealthJournalNotesDiagonesIdResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetHealthJournalNotesDiagonesIdResponseDto(
  diagnosis: json['diagnosis'] == null
      ? null
      : DiagnosisNoteDto.fromJson(json['diagnosis'] as Map<String, dynamic>),
  notes: (json['notes'] as List<dynamic>?)
      ?.map((e) => NoteDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetHealthJournalNotesDiagonesIdResponseDtoToJson(
  GetHealthJournalNotesDiagonesIdResponseDto instance,
) => <String, dynamic>{
  'diagnosis': instance.diagnosis,
  'notes': instance.notes,
};
