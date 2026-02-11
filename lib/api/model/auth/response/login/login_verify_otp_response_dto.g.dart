// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_verify_otp_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginVerifyOtpResponseDto _$LoginVerifyOtpResponseDtoFromJson(
  Map<String, dynamic> json,
) => LoginVerifyOtpResponseDto(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  userId: json['userId'] as String?,
  email: json['email'] as String?,
  role: json['role'] as String?,
  accessToken: json['accessToken'] as String?,
  refreshToken: json['refreshToken'] as String?,
);

Map<String, dynamic> _$LoginVerifyOtpResponseDtoToJson(
  LoginVerifyOtpResponseDto instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'userId': instance.userId,
  'email': instance.email,
  'role': instance.role,
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
};
