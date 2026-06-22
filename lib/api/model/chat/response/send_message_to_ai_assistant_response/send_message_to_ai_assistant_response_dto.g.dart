// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_to_ai_assistant_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessageToAiAssistantResponseDto
_$SendMessageToAiAssistantResponseDtoFromJson(
  Map<String, dynamic> json,
) => SendMessageToAiAssistantResponseDto(
  userMessage: json['userMessage'] == null
      ? null
      : UserMessageDto.fromJson(json['userMessage'] as Map<String, dynamic>),
  assistantMessage: json['assistantMessage'] == null
      ? null
      : AssistantMessageDto.fromJson(
          json['assistantMessage'] as Map<String, dynamic>,
        ),
  session: json['session'] == null
      ? null
      : SessionSendMessageDto.fromJson(json['session'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : MetaDto.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SendMessageToAiAssistantResponseDtoToJson(
  SendMessageToAiAssistantResponseDto instance,
) => <String, dynamic>{
  'userMessage': instance.userMessage,
  'assistantMessage': instance.assistantMessage,
  'session': instance.session,
  'meta': instance.meta,
};
