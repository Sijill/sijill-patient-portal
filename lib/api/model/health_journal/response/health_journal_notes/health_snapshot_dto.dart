import 'package:json_annotation/json_annotation.dart';

part 'health_snapshot_dto.g.dart';

@JsonSerializable()
class HealthSnapshotDto {
  String? note;

  HealthSnapshotDto({this.note});

  factory HealthSnapshotDto.fromJson(Map<String, dynamic> json) {
    return _$HealthSnapshotDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HealthSnapshotDtoToJson(this);
}
