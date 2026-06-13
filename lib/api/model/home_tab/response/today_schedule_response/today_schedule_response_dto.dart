import 'package:json_annotation/json_annotation.dart';

import 'schedule_dto.dart';

part 'today_schedule_response_dto.g.dart';

@JsonSerializable()
class TodayScheduleResponseDto {
  List<ScheduleDto>? schedule;

  TodayScheduleResponseDto({this.schedule});

  factory TodayScheduleResponseDto.fromJson(Map<String, dynamic> json) {
    return _$TodayScheduleResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TodayScheduleResponseDtoToJson(this);
}
