// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_active_patient_reminders_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListActivePatientRemindersResponseDto
_$ListActivePatientRemindersResponseDtoFromJson(Map<String, dynamic> json) =>
    ListActivePatientRemindersResponseDto(
      reminders: (json['reminders'] as List<dynamic>?)
          ?.map((e) => ReminderDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      grouped: json['grouped'] == null
          ? null
          : GroupedDto.fromJson(json['grouped'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListActivePatientRemindersResponseDtoToJson(
  ListActivePatientRemindersResponseDto instance,
) => <String, dynamic>{
  'reminders': instance.reminders,
  'grouped': instance.grouped,
};
