// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_permission_token_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratePermissionTokenRequestDto _$GeneratePermissionTokenRequestDtoFromJson(
  Map<String, dynamic> json,
) => GeneratePermissionTokenRequestDto(
  entityType: json['entityType'] as String?,
  accessType: json['accessType'] as String?,
  expiresInMinutes: (json['expiresInMinutes'] as num?)?.toInt(),
);

Map<String, dynamic> _$GeneratePermissionTokenRequestDtoToJson(
  GeneratePermissionTokenRequestDto instance,
) => <String, dynamic>{
  'entityType': instance.entityType,
  'accessType': instance.accessType,
  'expiresInMinutes': instance.expiresInMinutes,
};
