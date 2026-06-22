// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_send_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionSendMessageDto _$SessionSendMessageDtoFromJson(
  Map<String, dynamic> json,
) => SessionSendMessageDto(
  id: json['id'] as String?,
  messageCount: (json['messageCount'] as num?)?.toInt(),
  title: json['title'] as String?,
);

Map<String, dynamic> _$SessionSendMessageDtoToJson(
  SessionSendMessageDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'messageCount': instance.messageCount,
  'title': instance.title,
};
