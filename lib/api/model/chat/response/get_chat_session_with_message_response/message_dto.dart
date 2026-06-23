import 'package:json_annotation/json_annotation.dart';

part 'message_dto.g.dart';

@JsonSerializable()
class MessageDto {
  String? id;
  String? sessionId;
  String? role;
  String? content;
  dynamic metadata;
  DateTime? createdAt;

  MessageDto({
    this.id,
    this.sessionId,
    this.role,
    this.content,
    this.metadata,
    this.createdAt,
  });

  factory MessageDto.fromJson(Map<String, dynamic> json) {
    return _$MessageDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MessageDtoToJson(this);
}
