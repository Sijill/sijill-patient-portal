import 'package:json_annotation/json_annotation.dart';

part 'session_dto.g.dart';

@JsonSerializable()
class SessionDto {
  String? id;
  String? patientId;
  String? status;
  String? title;
  int? messageCount;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic lastMessagePreview;

  SessionDto({
    this.id,
    this.patientId,
    this.status,
    this.title,
    this.messageCount,
    this.createdAt,
    this.updatedAt,
    this.lastMessagePreview,
  });

  factory SessionDto.fromJson(Map<String, dynamic> json) {
    return _$SessionDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SessionDtoToJson(this);
}
