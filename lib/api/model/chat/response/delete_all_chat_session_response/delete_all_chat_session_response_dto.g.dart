// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_all_chat_session_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteAllChatSessionResponseDto _$DeleteAllChatSessionResponseDtoFromJson(
  Map<String, dynamic> json,
) => DeleteAllChatSessionResponseDto(
  message: json['message'] as String?,
  deletedCount: (json['deletedCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$DeleteAllChatSessionResponseDtoToJson(
  DeleteAllChatSessionResponseDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'deletedCount': instance.deletedCount,
};
