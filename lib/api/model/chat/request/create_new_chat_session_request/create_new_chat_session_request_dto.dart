import 'package:json_annotation/json_annotation.dart';

part 'create_new_chat_session_request_dto.g.dart';

@JsonSerializable()
class CreateNewChatSessionRequestDto {
  String? title;

  CreateNewChatSessionRequestDto({this.title});

  factory CreateNewChatSessionRequestDto.fromJson(Map<String, dynamic> json) {
    return _$CreateNewChatSessionRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CreateNewChatSessionRequestDtoToJson(this);
  }
}
