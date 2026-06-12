// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_patient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicationPatientDto _$MedicationPatientDtoFromJson(
  Map<String, dynamic> json,
) => MedicationPatientDto(
  medicationId: json['medicationId'] as String?,
  dosageAmount: json['dosageAmount'],
);

Map<String, dynamic> _$MedicationPatientDtoToJson(
  MedicationPatientDto instance,
) => <String, dynamic>{
  'medicationId': instance.medicationId,
  'dosageAmount': instance.dosageAmount,
};
