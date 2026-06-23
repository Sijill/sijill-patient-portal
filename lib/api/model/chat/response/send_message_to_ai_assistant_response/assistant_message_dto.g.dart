// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assistant_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssistantMessageDto _$AssistantMessageDtoFromJson(Map<String, dynamic> json) =>
    AssistantMessageDto(
      id: json['id'] as String?,
      role: json['role'] as String?,
      content: json['content'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$AssistantMessageDtoToJson(
  AssistantMessageDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'role': instance.role,
  'content': instance.content,
  'createdAt': instance.createdAt?.toIso8601String(),
};
