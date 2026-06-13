import 'package:json_annotation/json_annotation.dart';

part 'schedule_dto.g.dart';

@JsonSerializable()
class ScheduleDto {
  String? time;
  String? what;
  String? kind;

  ScheduleDto({this.time, this.what, this.kind});

  factory ScheduleDto.fromJson(Map<String, dynamic> json) {
    return _$ScheduleDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ScheduleDtoToJson(this);
}
