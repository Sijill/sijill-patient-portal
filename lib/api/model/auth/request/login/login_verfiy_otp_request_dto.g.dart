// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_verfiy_otp_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginVerfiyOtpRequestDto _$LoginVerfiyOtpRequestDtoFromJson(
  Map<String, dynamic> json,
) => LoginVerfiyOtpRequestDto(
  loginSessionId: json['loginSessionId'] as String?,
  otp: json['otp'] as String?,
);

Map<String, dynamic> _$LoginVerfiyOtpRequestDtoToJson(
  LoginVerfiyOtpRequestDto instance,
) => <String, dynamic>{
  'loginSessionId': instance.loginSessionId,
  'otp': instance.otp,
};
