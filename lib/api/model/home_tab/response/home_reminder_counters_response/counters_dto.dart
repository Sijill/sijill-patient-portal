import 'package:json_annotation/json_annotation.dart';

part 'counters_dto.g.dart';

@JsonSerializable()
class CountersDto {
  int? medicationReminders;
  int? upcomingAppointments;
  int? pendingTestOrders;

  CountersDto({
    this.medicationReminders,
    this.upcomingAppointments,
    this.pendingTestOrders,
  });

  factory CountersDto.fromJson(Map<String, dynamic> json) {
    return _$CountersDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CountersDtoToJson(this);
}
