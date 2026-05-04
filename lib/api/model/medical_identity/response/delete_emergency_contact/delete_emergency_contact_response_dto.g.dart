// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_emergency_contact_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteEmergencyContactResponseDto _$DeleteEmergencyContactResponseDtoFromJson(
  Map<String, dynamic> json,
) => DeleteEmergencyContactResponseDto(
  message: json['message'] as String?,
  error: json['error'] as String?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
);

Map<String, dynamic> _$DeleteEmergencyContactResponseDtoToJson(
  DeleteEmergencyContactResponseDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'error': instance.error,
  'statusCode': instance.statusCode,
};
