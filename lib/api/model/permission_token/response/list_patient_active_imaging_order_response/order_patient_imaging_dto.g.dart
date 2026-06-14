// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_patient_imaging_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderPatientImagingDto _$OrderPatientImagingDtoFromJson(
  Map<String, dynamic> json,
) => OrderPatientImagingDto(
  orderId: json['orderId'] as String?,
  orderType: json['orderType'] as String?,
  orderStatus: json['orderStatus'] as String?,
  orderedAt: json['orderedAt'] == null
      ? null
      : DateTime.parse(json['orderedAt'] as String),
  orderedBy: json['orderedBy'] as String?,
  orderedBySpecialization: json['orderedBySpecialization'] as String?,
  imagingOrder: json['imagingOrder'] == null
      ? null
      : ImagingOrderDto.fromJson(json['imagingOrder'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderPatientImagingDtoToJson(
  OrderPatientImagingDto instance,
) => <String, dynamic>{
  'orderId': instance.orderId,
  'orderType': instance.orderType,
  'orderStatus': instance.orderStatus,
  'orderedAt': instance.orderedAt?.toIso8601String(),
  'orderedBy': instance.orderedBy,
  'orderedBySpecialization': instance.orderedBySpecialization,
  'imagingOrder': instance.imagingOrder,
};
