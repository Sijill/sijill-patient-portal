// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_health_journal_diagonses_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHealthJournalDiagonsesResponseDto
_$GetHealthJournalDiagonsesResponseDtoFromJson(Map<String, dynamic> json) =>
    GetHealthJournalDiagonsesResponseDto(
      diagnoses: (json['diagnoses'] as List<dynamic>?)
          ?.map((e) => DiagnosisDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetHealthJournalDiagonsesResponseDtoToJson(
  GetHealthJournalDiagonsesResponseDto instance,
) => <String, dynamic>{'diagnoses': instance.diagnoses};
