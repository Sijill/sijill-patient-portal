// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_read_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationReadResponseDto _$NotificationReadResponseDtoFromJson(
  Map<String, dynamic> json,
) => NotificationReadResponseDto(
  notification: json['notification'] == null
      ? null
      : NotificationDto.fromJson(json['notification'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NotificationReadResponseDtoToJson(
  NotificationReadResponseDto instance,
) => <String, dynamic>{'notification': instance.notification};
