import 'package:json_annotation/json_annotation.dart';

part 'medication_patient_dto.g.dart';

@JsonSerializable()
class MedicationPatientDto {
  String? medicationId;
  dynamic dosageAmount;

  MedicationPatientDto({this.medicationId, this.dosageAmount});

  factory MedicationPatientDto.fromJson(Map<String, dynamic> json) {
    return _$MedicationPatientDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicationPatientDtoToJson(this);
}
