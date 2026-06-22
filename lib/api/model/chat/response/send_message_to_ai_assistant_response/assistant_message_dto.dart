import 'package:json_annotation/json_annotation.dart';

part 'assistant_message_dto.g.dart';

@JsonSerializable()
class AssistantMessageDto {
  String? id;
  String? role;
  String? content;
  DateTime? createdAt;

  AssistantMessageDto({this.id, this.role, this.content, this.createdAt});

  factory AssistantMessageDto.fromJson(Map<String, dynamic> json) {
    return _$AssistantMessageDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AssistantMessageDtoToJson(this);
}
