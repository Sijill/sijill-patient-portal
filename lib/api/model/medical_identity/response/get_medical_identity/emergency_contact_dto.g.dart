// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_contact_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmergencyContactDto _$EmergencyContactDtoFromJson(Map<String, dynamic> json) =>
    EmergencyContactDto(
      contactName: json['contactName'] as String?,
      relationship: json['relationship'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      isPrimary: json['isPrimary'] as bool?,
    );

Map<String, dynamic> _$EmergencyContactDtoToJson(
  EmergencyContactDto instance,
) => <String, dynamic>{
  'contactName': instance.contactName,
  'relationship': instance.relationship,
  'phoneNumber': instance.phoneNumber,
  'isPrimary': instance.isPrimary,
};
