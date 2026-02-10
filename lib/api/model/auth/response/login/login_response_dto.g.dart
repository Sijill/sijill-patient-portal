// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseDto _$LoginResponseDtoFromJson(Map<String, dynamic> json) =>
    LoginResponseDto(
      loginSessionId: json['loginSessionId'] as String?,
      otpDelivery: json['otpDelivery'] as String?,
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
    );

Map<String, dynamic> _$LoginResponseDtoToJson(LoginResponseDto instance) =>
    <String, dynamic>{
      'loginSessionId': instance.loginSessionId,
      'otpDelivery': instance.otpDelivery,
      'expiresAt': instance.expiresAt?.toIso8601String(),
    };
