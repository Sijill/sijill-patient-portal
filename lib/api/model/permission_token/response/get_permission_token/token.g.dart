// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
  tokenId: json['tokenId'] as String?,
  entityType: json['entityType'] as String?,
  accessType: json['accessType'] as String?,
  expiresAt: json['expiresAt'] == null
      ? null
      : DateTime.parse(json['expiresAt'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  wasUsed: json['wasUsed'] as bool?,
);

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
  'tokenId': instance.tokenId,
  'entityType': instance.entityType,
  'accessType': instance.accessType,
  'expiresAt': instance.expiresAt?.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
  'wasUsed': instance.wasUsed,
};
