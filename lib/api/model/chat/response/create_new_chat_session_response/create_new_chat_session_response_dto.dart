import 'package:json_annotation/json_annotation.dart';

import 'session_dto.dart';

part 'create_new_chat_session_response_dto.g.dart';

@JsonSerializable()
class CreateNewChatSessionResponseDto {
  SessionDto? session;

  CreateNewChatSessionResponseDto({this.session});

  factory CreateNewChatSessionResponseDto.fromJson(Map<String, dynamic> json) {
    return _$CreateNewChatSessionResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CreateNewChatSessionResponseDtoToJson(this);
  }
}
