import 'package:json_annotation/json_annotation.dart';

import 'order_patient_imaging_dto.dart';

part 'list_patient_active_imaging_order_response_dto.g.dart';

@JsonSerializable()
class ListPatientActiveImagingOrderResponseDto {
  List<OrderPatientImagingDto>? orders;

  ListPatientActiveImagingOrderResponseDto({this.orders});

  factory ListPatientActiveImagingOrderResponseDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$ListPatientActiveImagingOrderResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ListPatientActiveImagingOrderResponseDtoToJson(this);
  }
}
