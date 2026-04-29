// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_emergency_contact_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddEmergencyContactRequestDto _$AddEmergencyContactRequestDtoFromJson(
  Map<String, dynamic> json,
) => AddEmergencyContactRequestDto(
  contactName: json['contactName'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  relationship: json['relationship'] as String?,
  isPrimary: json['isPrimary'] as bool?,
);

Map<String, dynamic> _$AddEmergencyContactRequestDtoToJson(
  AddEmergencyContactRequestDto instance,
) => <String, dynamic>{
  'contactName': instance.contactName,
  'phoneNumber': instance.phoneNumber,
  'relationship': instance.relationship,
  'isPrimary': instance.isPrimary,
};
