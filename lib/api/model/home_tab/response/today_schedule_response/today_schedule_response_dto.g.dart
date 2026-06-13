// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_schedule_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodayScheduleResponseDto _$TodayScheduleResponseDtoFromJson(
  Map<String, dynamic> json,
) => TodayScheduleResponseDto(
  schedule: (json['schedule'] as List<dynamic>?)
      ?.map((e) => ScheduleDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TodayScheduleResponseDtoToJson(
  TodayScheduleResponseDto instance,
) => <String, dynamic>{'schedule': instance.schedule};
