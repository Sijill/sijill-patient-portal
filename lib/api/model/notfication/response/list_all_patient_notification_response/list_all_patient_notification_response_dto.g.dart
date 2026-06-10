// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_all_patient_notification_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListAllPatientNotificationResponseDto
_$ListAllPatientNotificationResponseDtoFromJson(Map<String, dynamic> json) =>
    ListAllPatientNotificationResponseDto(
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map((e) => NotificationDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListAllPatientNotificationResponseDtoToJson(
  ListAllPatientNotificationResponseDto instance,
) => <String, dynamic>{'notifications': instance.notifications};
