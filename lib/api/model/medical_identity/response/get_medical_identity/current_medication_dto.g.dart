// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_medication_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentMedicationDto _$CurrentMedicationDtoFromJson(
  Map<String, dynamic> json,
) => CurrentMedicationDto(
  medicationName: json['medicationName'] as String?,
  dosageAmount: (json['dosageAmount'] as num?)?.toInt(),
  dosageUnit: json['dosageUnit'] as String?,
  form: json['form'] as String?,
  frequency: json['frequency'] as String?,
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
  prescribedBy: json['prescribedBy'] as String?,
  prescribedAt: json['prescribedAt'] == null
      ? null
      : DateTime.parse(json['prescribedAt'] as String),
);

Map<String, dynamic> _$CurrentMedicationDtoToJson(
  CurrentMedicationDto instance,
) => <String, dynamic>{
  'medicationName': instance.medicationName,
  'dosageAmount': instance.dosageAmount,
  'dosageUnit': instance.dosageUnit,
  'form': instance.form,
  'frequency': instance.frequency,
  'startDate': instance.startDate?.toIso8601String(),
  'endDate': instance.endDate?.toIso8601String(),
  'prescribedBy': instance.prescribedBy,
  'prescribedAt': instance.prescribedAt?.toIso8601String(),
};
