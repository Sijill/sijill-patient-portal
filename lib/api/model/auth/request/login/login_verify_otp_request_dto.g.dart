// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_verify_otp_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginVerifyOtpRequestDto _$LoginVerifyOtpRequestDtoFromJson(
  Map<String, dynamic> json,
) => LoginVerifyOtpRequestDto(
  loginSessionId: json['loginSessionId'] as String?,
  otp: json['otp'] as String?,
  platform: json['platform'] as String?,
);

Map<String, dynamic> _$LoginVerifyOtpRequestDtoToJson(
  LoginVerifyOtpRequestDto instance,
) => <String, dynamic>{
  'loginSessionId': instance.loginSessionId,
  'otp': instance.otp,
  'platform': instance.platform,
};
