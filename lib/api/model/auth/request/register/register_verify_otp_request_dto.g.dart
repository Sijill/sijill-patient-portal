// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_verify_otp_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterVerifyOtpRequestDto _$RegisterVerifyOtpRequestDtoFromJson(
  Map<String, dynamic> json,
) => RegisterVerifyOtpRequestDto(
  registrationSessionId: json['registrationSessionId'] as String?,
  otp: json['otp'] as String?,
);

Map<String, dynamic> _$RegisterVerifyOtpRequestDtoToJson(
  RegisterVerifyOtpRequestDto instance,
) => <String, dynamic>{
  'registrationSessionId': instance.registrationSessionId,
  'otp': instance.otp,
};
