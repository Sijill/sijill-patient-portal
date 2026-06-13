// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => OrderDto(
  orderId: json['orderId'] as String?,
  orderType: json['orderType'] as String?,
  orderStatus: json['orderStatus'] as String?,
  orderedAt: json['orderedAt'] == null
      ? null
      : DateTime.parse(json['orderedAt'] as String),
  orderedBy: json['orderedBy'] as String?,
  orderedBySpecialization: json['orderedBySpecialization'] as String?,
  labOrder: json['labOrder'] == null
      ? null
      : LabOrderDto.fromJson(json['labOrder'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderDtoToJson(OrderDto instance) => <String, dynamic>{
  'orderId': instance.orderId,
  'orderType': instance.orderType,
  'orderStatus': instance.orderStatus,
  'orderedAt': instance.orderedAt?.toIso8601String(),
  'orderedBy': instance.orderedBy,
  'orderedBySpecialization': instance.orderedBySpecialization,
  'labOrder': instance.labOrder,
};
