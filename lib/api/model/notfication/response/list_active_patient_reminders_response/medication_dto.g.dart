// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicationDto _$MedicationDtoFromJson(Map<String, dynamic> json) =>
    MedicationDto(
      medicationId: json['medicationId'] as String?,
      name: json['name'] as String?,
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
    );

Map<String, dynamic> _$MedicationDtoToJson(MedicationDto instance) =>
    <String, dynamic>{
      'medicationId': instance.medicationId,
      'name': instance.name,
      'dosageAmount': instance.dosageAmount,
      'dosageUnit': instance.dosageUnit,
      'form': instance.form,
      'frequency': instance.frequency,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'prescribedBy': instance.prescribedBy,
    };
