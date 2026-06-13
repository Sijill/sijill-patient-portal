import 'package:json_annotation/json_annotation.dart';

import 'order_dto.dart';

part 'list_patient_active_lab_order_response_dto.g.dart';

@JsonSerializable()
class ListPatientActiveLabOrderResponseDto {
  List<OrderDto>? orders;

  ListPatientActiveLabOrderResponseDto({this.orders});

  factory ListPatientActiveLabOrderResponseDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$ListPatientActiveLabOrderResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ListPatientActiveLabOrderResponseDtoToJson(this);
  }
}
