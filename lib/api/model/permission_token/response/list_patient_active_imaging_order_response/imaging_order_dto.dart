import 'package:json_annotation/json_annotation.dart';

part 'imaging_order_dto.g.dart';

@JsonSerializable()
class ImagingOrderDto {
  String? imagingType;
  String? bodyPart;
  String? priority;
  bool? contrastUsed;
  String? clinicalIndication;

  ImagingOrderDto({
    this.imagingType,
    this.bodyPart,
    this.priority,
    this.contrastUsed,
    this.clinicalIndication,
  });

  factory ImagingOrderDto.fromJson(Map<String, dynamic> json) {
    return _$ImagingOrderDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ImagingOrderDtoToJson(this);
}
