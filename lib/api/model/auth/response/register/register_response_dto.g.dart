// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseDto _$RegisterResponseDtoFromJson(Map<String, dynamic> json) =>
    RegisterResponseDto(
      registrationSessionId: json['registrationSessionId'] as String?,
      otpDelivery: json['otpDelivery'] as String?,
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
    );

Map<String, dynamic> _$RegisterResponseDtoToJson(
  RegisterResponseDto instance,
) => <String, dynamic>{
  'registrationSessionId': instance.registrationSessionId,
  'otpDelivery': instance.otpDelivery,
  'expiresAt': instance.expiresAt?.toIso8601String(),
};
