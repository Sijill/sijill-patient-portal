// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_lab_permission_token_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateLabPermissionTokenResponseDto
_$GenerateLabPermissionTokenResponseDtoFromJson(Map<String, dynamic> json) =>
    GenerateLabPermissionTokenResponseDto(
      tokenId: json['tokenId'] as String?,
      code: json['code'] as String?,
      entityType: json['entityType'] as String?,
      accessType: json['accessType'] as String?,
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      medicalOrderId: json['medicalOrderId'] as String?,
    );

Map<String, dynamic> _$GenerateLabPermissionTokenResponseDtoToJson(
  GenerateLabPermissionTokenResponseDto instance,
) => <String, dynamic>{
  'tokenId': instance.tokenId,
  'code': instance.code,
  'entityType': instance.entityType,
  'accessType': instance.accessType,
  'expiresAt': instance.expiresAt?.toIso8601String(),
  'medicalOrderId': instance.medicalOrderId,
};
