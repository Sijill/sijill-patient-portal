// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_patient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReminderPatientDto _$ReminderPatientDtoFromJson(Map<String, dynamic> json) =>
    ReminderPatientDto(
      reminderId: json['reminderId'] as String?,
      reminderType: json['reminderType'] as String?,
      startsAt: json['startsAt'] == null
          ? null
          : DateTime.parse(json['startsAt'] as String),
      endsAt: json['endsAt'],
      appointmentAt: json['appointmentAt'],
      reminderTime: json['reminderTime'] as String?,
      customDays: (json['customDays'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      isActive: json['isActive'] as bool?,
      dismissedAt: json['dismissedAt'],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      medication: json['medication'] == null
          ? null
          : MedicationPatientDto.fromJson(
              json['medication'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ReminderPatientDtoToJson(ReminderPatientDto instance) =>
    <String, dynamic>{
      'reminderId': instance.reminderId,
      'reminderType': instance.reminderType,
      'startsAt': instance.startsAt?.toIso8601String(),
      'endsAt': instance.endsAt,
      'appointmentAt': instance.appointmentAt,
      'reminderTime': instance.reminderTime,
      'customDays': instance.customDays,
      'isActive': instance.isActive,
      'dismissedAt': instance.dismissedAt,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'medication': instance.medication,
    };
