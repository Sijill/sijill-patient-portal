// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_token_revoke_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermissionTokenRevokeResponseDto _$PermissionTokenRevokeResponseDtoFromJson(
  Map<String, dynamic> json,
) => PermissionTokenRevokeResponseDto(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  tokenId: json['tokenId'] as String?,
  revokedAt: json['revokedAt'] == null
      ? null
      : DateTime.parse(json['revokedAt'] as String),
);

Map<String, dynamic> _$PermissionTokenRevokeResponseDtoToJson(
  PermissionTokenRevokeResponseDto instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'tokenId': instance.tokenId,
  'revokedAt': instance.revokedAt?.toIso8601String(),
};
