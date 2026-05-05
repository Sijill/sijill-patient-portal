// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_health_journal_notes_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHealthJournalNotesResponseDto _$GetHealthJournalNotesResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetHealthJournalNotesResponseDto(
  diagnoses: (json['diagnoses'] as List<dynamic>?)
      ?.map((e) => DiagnosisDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetHealthJournalNotesResponseDtoToJson(
  GetHealthJournalNotesResponseDto instance,
) => <String, dynamic>{'diagnoses': instance.diagnoses};
