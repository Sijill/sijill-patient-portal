// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_profile_image_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadProfileImageResponseDto _$UploadProfileImageResponseDtoFromJson(
  Map<String, dynamic> json,
) => UploadProfileImageResponseDto(
  message: json['message'] as String?,
  error: json['error'] as String?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
);

Map<String, dynamic> _$UploadProfileImageResponseDtoToJson(
  UploadProfileImageResponseDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'error': instance.error,
  'statusCode': instance.statusCode,
};
