import 'package:json_annotation/json_annotation.dart';

part 'medical_order_dto.g.dart';

@JsonSerializable()
class MedicalOrderDto {
  String? medicalOrderId;
  String? orderType;
  String? orderName;
  String? priority;
  String? status;
  DateTime? orderedAt;
  String? orderedBy;
  String? specimenType;
  dynamic bodyPart;

  MedicalOrderDto({
    this.medicalOrderId,
    this.orderType,
    this.orderName,
    this.priority,
    this.status,
    this.orderedAt,
    this.orderedBy,
    this.specimenType,
    this.bodyPart,
  });

  factory MedicalOrderDto.fromJson(Map<String, dynamic> json) {
    return _$MedicalOrderDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalOrderDtoToJson(this);
}
