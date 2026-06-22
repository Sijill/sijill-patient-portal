// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMessageDto _$UserMessageDtoFromJson(Map<String, dynamic> json) =>
    UserMessageDto(
      id: json['id'] as String?,
      role: json['role'] as String?,
      content: json['content'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$UserMessageDtoToJson(UserMessageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
