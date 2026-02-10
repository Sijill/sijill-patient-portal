// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_resend_otp_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResendOtpResponseDto _$LoginResendOtpResponseDtoFromJson(
  Map<String, dynamic> json,
) => LoginResendOtpResponseDto(
  loginSessionId: json['loginSessionId'] as String?,
  otpDelivery: json['otpDelivery'] as String?,
  expiresAt: json['expiresAt'] == null
      ? null
      : DateTime.parse(json['expiresAt'] as String),
);

Map<String, dynamic> _$LoginResendOtpResponseDtoToJson(
  LoginResendOtpResponseDto instance,
) => <String, dynamic>{
  'loginSessionId': instance.loginSessionId,
  'otpDelivery': instance.otpDelivery,
  'expiresAt': instance.expiresAt?.toIso8601String(),
};
