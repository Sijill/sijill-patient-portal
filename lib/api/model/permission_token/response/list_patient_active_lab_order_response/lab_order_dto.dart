import 'package:json_annotation/json_annotation.dart';

part 'lab_order_dto.g.dart';

@JsonSerializable()
class LabOrderDto {
  String? testType;
  String? specimenType;
  String? priority;
  bool? fastingRequired;
  String? clinicalIndication;

  LabOrderDto({
    this.testType,
    this.specimenType,
    this.priority,
    this.fastingRequired,
    this.clinicalIndication,
  });

  factory LabOrderDto.fromJson(Map<String, dynamic> json) {
    return _$LabOrderDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LabOrderDtoToJson(this);
}
