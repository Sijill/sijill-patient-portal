// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_reset_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordResetResponseDto _$PasswordResetResponseDtoFromJson(
  Map<String, dynamic> json,
) => PasswordResetResponseDto(
  resetSessionId: json['resetSessionId'] as String?,
  otpDelivery: json['otpDelivery'] as String?,
  expiresAt: json['expiresAt'] == null
      ? null
      : DateTime.parse(json['expiresAt'] as String),
);

Map<String, dynamic> _$PasswordResetResponseDtoToJson(
  PasswordResetResponseDto instance,
) => <String, dynamic>{
  'resetSessionId': instance.resetSessionId,
  'otpDelivery': instance.otpDelivery,
  'expiresAt': instance.expiresAt?.toIso8601String(),
};
