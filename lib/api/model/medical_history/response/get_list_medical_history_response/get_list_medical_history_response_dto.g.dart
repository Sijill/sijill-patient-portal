// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_list_medical_history_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetListMedicalHistoryResponseDto _$GetListMedicalHistoryResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetListMedicalHistoryResponseDto(
  encounters: (json['encounters'] as List<dynamic>?)
      ?.map((e) => EncounterDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetListMedicalHistoryResponseDtoToJson(
  GetListMedicalHistoryResponseDto instance,
) => <String, dynamic>{'encounters': instance.encounters};
