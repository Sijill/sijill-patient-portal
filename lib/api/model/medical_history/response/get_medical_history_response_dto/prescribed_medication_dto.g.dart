// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescribed_medication_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrescribedMedicationDto _$PrescribedMedicationDtoFromJson(
  Map<String, dynamic> json,
) => PrescribedMedicationDto(
  medicationName: json['medicationName'] as String?,
  dosageAmount: (json['dosageAmount'] as num?)?.toInt(),
  dosageUnit: json['dosageUnit'] as String?,
  form: json['form'] as String?,
  frequency: json['frequency'] as String?,
  instructions: json['instructions'] as String?,
  startDate: json['startDate'] as String?,
  endDate: json['endDate'],
);

Map<String, dynamic> _$PrescribedMedicationDtoToJson(
  PrescribedMedicationDto instance,
) => <String, dynamic>{
  'medicationName': instance.medicationName,
  'dosageAmount': instance.dosageAmount,
  'dosageUnit': instance.dosageUnit,
  'form': instance.form,
  'frequency': instance.frequency,
  'instructions': instance.instructions,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
};
