// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_patient_reminders_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePatientRemindersResponseDto _$UpdatePatientRemindersResponseDtoFromJson(
  Map<String, dynamic> json,
) => UpdatePatientRemindersResponseDto(
  reminder: json['reminder'] == null
      ? null
      : ReminderPatientDto.fromJson(json['reminder'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UpdatePatientRemindersResponseDtoToJson(
  UpdatePatientRemindersResponseDto instance,
) => <String, dynamic>{'reminder': instance.reminder};
