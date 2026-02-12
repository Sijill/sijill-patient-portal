// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_reset_confirm_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordResetConfirmResponseDto _$PasswordResetConfirmResponseDtoFromJson(
  Map<String, dynamic> json,
) => PasswordResetConfirmResponseDto(
  success: json['success'] as bool?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$PasswordResetConfirmResponseDtoToJson(
  PasswordResetConfirmResponseDto instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
};
