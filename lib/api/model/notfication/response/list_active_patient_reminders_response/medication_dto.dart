import 'package:json_annotation/json_annotation.dart';

part 'medication_dto.g.dart';

@JsonSerializable()
class MedicationDto {
  String? medicationId;
  String? name;
  int? dosageAmount;
  String? dosageUnit;
  String? form;
  String? frequency;
  DateTime? startDate;
  dynamic endDate;
  String? prescribedBy;

  MedicationDto({
    this.medicationId,
    this.name,
    this.dosageAmount,
    this.dosageUnit,
    this.form,
    this.frequency,
    this.startDate,
    this.endDate,
    this.prescribedBy,
  });

  factory MedicationDto.fromJson(Map<String, dynamic> json) {
    return _$MedicationDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicationDtoToJson(this);
}
