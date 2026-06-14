import 'package:json_annotation/json_annotation.dart';

import 'imaging_order_dto.dart';

part 'order_patient_imaging_dto.g.dart';

@JsonSerializable()
class OrderPatientImagingDto {
  String? orderId;
  String? orderType;
  String? orderStatus;
  DateTime? orderedAt;
  String? orderedBy;
  String? orderedBySpecialization;
  ImagingOrderDto? imagingOrder;

  OrderPatientImagingDto({
    this.orderId,
    this.orderType,
    this.orderStatus,
    this.orderedAt,
    this.orderedBy,
    this.orderedBySpecialization,
    this.imagingOrder,
  });

  factory OrderPatientImagingDto.fromJson(Map<String, dynamic> json) =>
      _$OrderPatientImagingDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderPatientImagingDtoToJson(this);
}
