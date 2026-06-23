// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_chat_session_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListChatSessionResponseDto _$ListChatSessionResponseDtoFromJson(
  Map<String, dynamic> json,
) => ListChatSessionResponseDto(
  sessions: (json['sessions'] as List<dynamic>?)
      ?.map((e) => SessionDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ListChatSessionResponseDtoToJson(
  ListChatSessionResponseDto instance,
) => <String, dynamic>{'sessions': instance.sessions};
