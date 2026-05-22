import 'package:json_annotation/json_annotation.dart';

part 'prescribed_medication_dto.g.dart';

@JsonSerializable()
class PrescribedMedicationDto {
  String? medicationName;
  int? dosageAmount;
  String? dosageUnit;
  String? form;
  String? frequency;
  String? instructions;
  String? startDate;
  dynamic endDate;

  PrescribedMedicationDto({
    this.medicationName,
    this.dosageAmount,
    this.dosageUnit,
    this.form,
    this.frequency,
    this.instructions,
    this.startDate,
    this.endDate,
  });

  factory PrescribedMedicationDto.fromJson(Map<String, dynamic> json) {
    return _$PrescribedMedicationDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PrescribedMedicationDtoToJson(this);
}
