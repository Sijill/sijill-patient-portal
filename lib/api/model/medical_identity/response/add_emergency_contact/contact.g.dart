// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
  contactId: json['contact_id'] as String?,
  contactName: json['contact_name'] as String?,
  phoneNumber: json['phone_number'] as String?,
  relationship: json['relationship'] as String?,
  isPrimary: json['is_primary'] as bool?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
  'contact_id': instance.contactId,
  'contact_name': instance.contactName,
  'phone_number': instance.phoneNumber,
  'relationship': instance.relationship,
  'is_primary': instance.isPrimary,
  'created_at': instance.createdAt?.toIso8601String(),
};
