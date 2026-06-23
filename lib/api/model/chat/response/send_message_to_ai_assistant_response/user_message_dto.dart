import 'package:json_annotation/json_annotation.dart';

part 'user_message_dto.g.dart';

@JsonSerializable()
class UserMessageDto {
  String? id;
  String? role;
  String? content;
  DateTime? createdAt;

  UserMessageDto({this.id, this.role, this.content, this.createdAt});

  factory UserMessageDto.fromJson(Map<String, dynamic> json) {
    return _$UserMessageDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserMessageDtoToJson(this);
}
