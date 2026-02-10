// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_reset_confirm_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordResetConfirmRequestDto _$PasswordResetConfirmRequestDtoFromJson(
  Map<String, dynamic> json,
) => PasswordResetConfirmRequestDto(
  resetSessionId: json['resetSessionId'] as String?,
  otp: json['otp'] as String?,
  newPassword: json['newPassword'] as String?,
);

Map<String, dynamic> _$PasswordResetConfirmRequestDtoToJson(
  PasswordResetConfirmRequestDto instance,
) => <String, dynamic>{
  'resetSessionId': instance.resetSessionId,
  'otp': instance.otp,
  'newPassword': instance.newPassword,
};
