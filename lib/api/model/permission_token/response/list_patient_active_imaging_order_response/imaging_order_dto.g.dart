// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imaging_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagingOrderDto _$ImagingOrderDtoFromJson(Map<String, dynamic> json) =>
    ImagingOrderDto(
      imagingType: json['imagingType'] as String?,
      bodyPart: json['bodyPart'] as String?,
      priority: json['priority'] as String?,
      contrastUsed: json['contrastUsed'] as bool?,
      clinicalIndication: json['clinicalIndication'] as String?,
    );

Map<String, dynamic> _$ImagingOrderDtoToJson(ImagingOrderDto instance) =>
    <String, dynamic>{
      'imagingType': instance.imagingType,
      'bodyPart': instance.bodyPart,
      'priority': instance.priority,
      'contrastUsed': instance.contrastUsed,
      'clinicalIndication': instance.clinicalIndication,
    };
