// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_reset_resend_otp_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordResetResendOtpResponseDto _$PasswordResetResendOtpResponseDtoFromJson(
  Map<String, dynamic> json,
) => PasswordResetResendOtpResponseDto(
  resetSessionId: json['resetSessionId'] as String?,
  otpDelivery: json['otpDelivery'] as String?,
  expiresAt: json['expiresAt'] == null
      ? null
      : DateTime.parse(json['expiresAt'] as String),
);

Map<String, dynamic> _$PasswordResetResendOtpResponseDtoToJson(
  PasswordResetResendOtpResponseDto instance,
) => <String, dynamic>{
  'resetSessionId': instance.resetSessionId,
  'otpDelivery': instance.otpDelivery,
  'expiresAt': instance.expiresAt?.toIso8601String(),
};
