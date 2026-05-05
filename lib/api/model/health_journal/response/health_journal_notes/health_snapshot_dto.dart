import 'package:json_annotation/json_annotation.dart';

part 'health_snapshot_dto.g.dart';

@JsonSerializable()
class HealthSnapshotDto {
  String? status;
  String? model;
  String? urgencyLevel;
  dynamic summary;
  List<dynamic>? advice;
  List<dynamic>? watchouts;
  List<dynamic>? whenToContactDoctor;
  String? disclaimer;
  String? unavailableReason;

  HealthSnapshotDto({
    this.status,
    this.model,
    this.urgencyLevel,
    this.summary,
    this.advice,
    this.watchouts,
    this.whenToContactDoctor,
    this.disclaimer,
    this.unavailableReason,
  });

  factory HealthSnapshotDto.fromJson(Map<String, dynamic> json) {
    return _$HealthSnapshotDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HealthSnapshotDtoToJson(this);
}
