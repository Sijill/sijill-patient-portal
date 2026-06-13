import 'package:json_annotation/json_annotation.dart';

import 'lab_order_dto.dart';

part 'order_dto.g.dart';

@JsonSerializable()
class OrderDto {
  String? orderId;
  String? orderType;
  String? orderStatus;
  DateTime? orderedAt;
  String? orderedBy;
  String? orderedBySpecialization;
  LabOrderDto? labOrder;

  OrderDto({
    this.orderId,
    this.orderType,
    this.orderStatus,
    this.orderedAt,
    this.orderedBy,
    this.orderedBySpecialization,
    this.labOrder,
  });

  factory OrderDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDtoToJson(this);
}
