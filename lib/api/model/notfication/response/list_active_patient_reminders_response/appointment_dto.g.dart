// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentDto _$AppointmentDtoFromJson(Map<String, dynamic> json) =>
    AppointmentDto(
      encounterId: json['encounterId'] as String?,
      doctorName: json['doctorName'] as String?,
      location: json['location'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$AppointmentDtoToJson(AppointmentDto instance) =>
    <String, dynamic>{
      'encounterId': instance.encounterId,
      'doctorName': instance.doctorName,
      'location': instance.location,
      'notes': instance.notes,
    };
