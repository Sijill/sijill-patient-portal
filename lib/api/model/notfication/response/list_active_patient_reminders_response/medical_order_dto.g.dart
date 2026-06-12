// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalOrderDto _$MedicalOrderDtoFromJson(Map<String, dynamic> json) =>
    MedicalOrderDto(
      medicalOrderId: json['medicalOrderId'] as String?,
      orderType: json['orderType'] as String?,
      orderName: json['orderName'] as String?,
      priority: json['priority'] as String?,
      status: json['status'] as String?,
      orderedAt: json['orderedAt'] == null
          ? null
          : DateTime.parse(json['orderedAt'] as String),
      orderedBy: json['orderedBy'] as String?,
      specimenType: json['specimenType'] as String?,
      bodyPart: json['bodyPart'],
    );

Map<String, dynamic> _$MedicalOrderDtoToJson(MedicalOrderDto instance) =>
    <String, dynamic>{
      'medicalOrderId': instance.medicalOrderId,
      'orderType': instance.orderType,
      'orderName': instance.orderName,
      'priority': instance.priority,
      'status': instance.status,
      'orderedAt': instance.orderedAt?.toIso8601String(),
      'orderedBy': instance.orderedBy,
      'specimenType': instance.specimenType,
      'bodyPart': instance.bodyPart,
    };
