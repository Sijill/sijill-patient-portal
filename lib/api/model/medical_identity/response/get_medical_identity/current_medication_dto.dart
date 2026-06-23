import 'package:json_annotation/json_annotation.dart';

part 'current_medication_dto.g.dart';

@JsonSerializable()
class CurrentMedicationDto {
  String? medicationName;
  int? dosageAmount;
  String? dosageUnit;
  String? form;
  String? frequency;
  DateTime? startDate;
  DateTime? endDate;
  String? prescribedBy;
  DateTime? prescribedAt;

  CurrentMedicationDto({
    this.medicationName,
    this.dosageAmount,
    this.dosageUnit,
    this.form,
    this.frequency,
    this.startDate,
    this.endDate,
    this.prescribedBy,
    this.prescribedAt,
  });

  factory CurrentMedicationDto.fromJson(Map<String, dynamic> json) {
    return _$CurrentMedicationDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CurrentMedicationDtoToJson(this);
}
