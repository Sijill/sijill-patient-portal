// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_reminder_counters_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeReminderCountersResponseDto _$HomeReminderCountersResponseDtoFromJson(
  Map<String, dynamic> json,
) => HomeReminderCountersResponseDto(
  counters: json['counters'] == null
      ? null
      : CountersDto.fromJson(json['counters'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HomeReminderCountersResponseDtoToJson(
  HomeReminderCountersResponseDto instance,
) => <String, dynamic>{'counters': instance.counters};
