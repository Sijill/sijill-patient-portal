// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grouped_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupedDto _$GroupedDtoFromJson(Map<String, dynamic> json) => GroupedDto(
  appointments: (json['appointments'] as List<dynamic>?)
      ?.map((e) => AppointmentDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  medications: (json['medications'] as List<dynamic>?)
      ?.map((e) => MedicationDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  medicalOrders: (json['medicalOrders'] as List<dynamic>?)
      ?.map((e) => MedicalOrderDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GroupedDtoToJson(GroupedDto instance) =>
    <String, dynamic>{
      'appointments': instance.appointments,
      'medications': instance.medications,
      'medicalOrders': instance.medicalOrders,
    };
