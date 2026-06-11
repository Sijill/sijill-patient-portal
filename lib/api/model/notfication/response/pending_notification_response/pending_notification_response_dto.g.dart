// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_notification_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PendingNotificationResponseDto _$PendingNotificationResponseDtoFromJson(
  Map<String, dynamic> json,
) => PendingNotificationResponseDto(
  notifications: (json['notifications'] as List<dynamic>?)
      ?.map((e) => NotificationDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PendingNotificationResponseDtoToJson(
  PendingNotificationResponseDto instance,
) => <String, dynamic>{'notifications': instance.notifications};
