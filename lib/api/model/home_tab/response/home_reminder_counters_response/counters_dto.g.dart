// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counters_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountersDto _$CountersDtoFromJson(Map<String, dynamic> json) => CountersDto(
  medicationReminders: (json['medicationReminders'] as num?)?.toInt(),
  upcomingAppointments: (json['upcomingAppointments'] as num?)?.toInt(),
  pendingTestOrders: (json['pendingTestOrders'] as num?)?.toInt(),
);

Map<String, dynamic> _$CountersDtoToJson(CountersDto instance) =>
    <String, dynamic>{
      'medicationReminders': instance.medicationReminders,
      'upcomingAppointments': instance.upcomingAppointments,
      'pendingTestOrders': instance.pendingTestOrders,
    };
