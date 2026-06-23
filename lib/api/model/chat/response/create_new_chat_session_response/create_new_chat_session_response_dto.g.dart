// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_new_chat_session_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateNewChatSessionResponseDto _$CreateNewChatSessionResponseDtoFromJson(
  Map<String, dynamic> json,
) => CreateNewChatSessionResponseDto(
  session: json['session'] == null
      ? null
      : SessionDto.fromJson(json['session'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreateNewChatSessionResponseDtoToJson(
  CreateNewChatSessionResponseDto instance,
) => <String, dynamic>{'session': instance.session};
