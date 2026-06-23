// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutRequestDto _$LogoutRequestDtoFromJson(Map<String, dynamic> json) =>
    LogoutRequestDto(
      platform: json['platform'] as String? ?? "mobile",
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$LogoutRequestDtoToJson(LogoutRequestDto instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'refreshToken': instance.refreshToken,
    };
