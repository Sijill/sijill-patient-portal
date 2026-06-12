// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationDto _$NotificationDtoFromJson(Map<String, dynamic> json) =>
    NotificationDto(
      notificationId: json['notificationId'] as String?,
      notificationType: json['notificationType'] as String?,
      status: json['status'] as String?,
      title: json['title'] as String?,
      message: json['message'] as String?,
      reminderId: json['reminderId'] as String?,
      scheduledFor: json['scheduledFor'] == null
          ? null
          : DateTime.parse(json['scheduledFor'] as String),
      sentAt: json['sentAt'],
      readAt: json['readAt'],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$NotificationDtoToJson(NotificationDto instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'notificationType': instance.notificationType,
      'status': instance.status,
      'title': instance.title,
      'message': instance.message,
      'reminderId': instance.reminderId,
      'scheduledFor': instance.scheduledFor?.toIso8601String(),
      'sentAt': instance.sentAt,
      'readAt': instance.readAt,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
