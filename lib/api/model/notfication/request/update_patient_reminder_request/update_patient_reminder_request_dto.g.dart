// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_patient_reminder_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePatientReminderRequestDto _$UpdatePatientReminderRequestDtoFromJson(
  Map<String, dynamic> json,
) => UpdatePatientReminderRequestDto(
  reminderTime: json['reminderTime'] as String?,
  customDays: (json['customDays'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$UpdatePatientReminderRequestDtoToJson(
  UpdatePatientReminderRequestDto instance,
) => <String, dynamic>{
  'reminderTime': instance.reminderTime,
  'customDays': instance.customDays,
};
