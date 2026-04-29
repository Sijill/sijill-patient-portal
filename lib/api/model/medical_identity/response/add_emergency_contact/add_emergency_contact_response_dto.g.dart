// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_emergency_contact_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddEmergencyContactResponseDto _$AddEmergencyContactResponseDtoFromJson(
  Map<String, dynamic> json,
) => AddEmergencyContactResponseDto(
  contact: json['contact'] == null
      ? null
      : Contact.fromJson(json['contact'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AddEmergencyContactResponseDtoToJson(
  AddEmergencyContactResponseDto instance,
) => <String, dynamic>{'contact': instance.contact};
