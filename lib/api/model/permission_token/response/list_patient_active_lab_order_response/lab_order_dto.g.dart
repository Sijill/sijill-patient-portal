// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabOrderDto _$LabOrderDtoFromJson(Map<String, dynamic> json) => LabOrderDto(
  testType: json['testType'] as String?,
  specimenType: json['specimenType'] as String?,
  priority: json['priority'] as String?,
  fastingRequired: json['fastingRequired'] as bool?,
  clinicalIndication: json['clinicalIndication'] as String?,
);

Map<String, dynamic> _$LabOrderDtoToJson(LabOrderDto instance) =>
    <String, dynamic>{
      'testType': instance.testType,
      'specimenType': instance.specimenType,
      'priority': instance.priority,
      'fastingRequired': instance.fastingRequired,
      'clinicalIndication': instance.clinicalIndication,
    };
