// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_chat_session_with_message_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetChatSessionWithMessageResponseDto
_$GetChatSessionWithMessageResponseDtoFromJson(Map<String, dynamic> json) =>
    GetChatSessionWithMessageResponseDto(
      session: json['session'] == null
          ? null
          : SessionDto.fromJson(json['session'] as Map<String, dynamic>),
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => MessageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetChatSessionWithMessageResponseDtoToJson(
  GetChatSessionWithMessageResponseDto instance,
) => <String, dynamic>{
  'session': instance.session,
  'messages': instance.messages,
};
