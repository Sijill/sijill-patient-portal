// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleDto _$ScheduleDtoFromJson(Map<String, dynamic> json) => ScheduleDto(
  time: json['time'] as String?,
  what: json['what'] as String?,
  kind: json['kind'] as String?,
);

Map<String, dynamic> _$ScheduleDtoToJson(ScheduleDto instance) =>
    <String, dynamic>{
      'time': instance.time,
      'what': instance.what,
      'kind': instance.kind,
    };
