// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_permission_token_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPermissionTokenResponseDto _$GetPermissionTokenResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetPermissionTokenResponseDto(
  tokens: (json['tokens'] as List<dynamic>?)
      ?.map((e) => Token.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetPermissionTokenResponseDtoToJson(
  GetPermissionTokenResponseDto instance,
) => <String, dynamic>{'tokens': instance.tokens};
