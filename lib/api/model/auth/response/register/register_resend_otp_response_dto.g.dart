// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_resend_otp_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResendOtpResponseDto _$RegisterResendOtpResponseDtoFromJson(
  Map<String, dynamic> json,
) => RegisterResendOtpResponseDto(
  registrationSessionId: json['registrationSessionId'] as String?,
  otpDelivery: json['otpDelivery'] as String?,
  expiresAt: json['expiresAt'] == null
      ? null
      : DateTime.parse(json['expiresAt'] as String),
);

Map<String, dynamic> _$RegisterResendOtpResponseDtoToJson(
  RegisterResendOtpResponseDto instance,
) => <String, dynamic>{
  'registrationSessionId': instance.registrationSessionId,
  'otpDelivery': instance.otpDelivery,
  'expiresAt': instance.expiresAt?.toIso8601String(),
};
