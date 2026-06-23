import 'package:json_annotation/json_annotation.dart';
import 'package:sijil_patient_portal/api/model/chat/response/create_new_chat_session_response/session_dto.dart';

import 'message_dto.dart';

part 'get_chat_session_with_message_response_dto.g.dart';

@JsonSerializable()
class GetChatSessionWithMessageResponseDto {
  SessionDto? session;
  List<MessageDto>? messages;

  GetChatSessionWithMessageResponseDto({this.session, this.messages});

  factory GetChatSessionWithMessageResponseDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GetChatSessionWithMessageResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetChatSessionWithMessageResponseDtoToJson(this);
  }
}
