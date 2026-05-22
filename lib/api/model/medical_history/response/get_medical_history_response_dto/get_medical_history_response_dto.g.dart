// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_medical_history_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMedicalHistoryResponseDto _$GetMedicalHistoryResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetMedicalHistoryResponseDto(
  encounter: json['encounter'] == null
      ? null
      : EncounterDto.fromJson(json['encounter'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetMedicalHistoryResponseDtoToJson(
  GetMedicalHistoryResponseDto instance,
) => <String, dynamic>{'encounter': instance.encounter};
