import 'package:json_annotation/json_annotation.dart';

import 'counters_dto.dart';

part 'home_reminder_counters_response_dto.g.dart';

@JsonSerializable()
class HomeReminderCountersResponseDto {
  CountersDto? counters;

  HomeReminderCountersResponseDto({this.counters});

  factory HomeReminderCountersResponseDto.fromJson(Map<String, dynamic> json) {
    return _$HomeReminderCountersResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HomeReminderCountersResponseDtoToJson(this);
  }
}
