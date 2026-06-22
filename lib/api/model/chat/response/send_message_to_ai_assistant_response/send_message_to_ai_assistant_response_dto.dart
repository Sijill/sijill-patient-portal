import 'package:json_annotation/json_annotation.dart';

import 'assistant_message_dto.dart';
import 'meta_dto.dart';
import 'session_send_message_dto.dart';
import 'user_message_dto.dart';

part 'send_message_to_ai_assistant_response_dto.g.dart';

@JsonSerializable()
class SendMessageToAiAssistantResponseDto {
  UserMessageDto? userMessage;
  AssistantMessageDto? assistantMessage;
  SessionSendMessageDto? session;
  MetaDto? meta;

  SendMessageToAiAssistantResponseDto({
    this.userMessage,
    this.assistantMessage,
    this.session,
    this.meta,
  });

  factory SendMessageToAiAssistantResponseDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$SendMessageToAiAssistantResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SendMessageToAiAssistantResponseDtoToJson(this);
  }
}
