import 'package:json_annotation/json_annotation.dart';

part 'notification_dto.g.dart';

@JsonSerializable()
class NotificationDto {
  String? notificationId;
  String? notificationType;
  String? status;
  String? title;
  String? message;
  String? reminderId;
  DateTime? scheduledFor;
  dynamic sentAt;
  dynamic readAt;
  DateTime? createdAt;

  NotificationDto({
    this.notificationId,
    this.notificationType,
    this.status,
    this.title,
    this.message,
    this.reminderId,
    this.scheduledFor,
    this.sentAt,
    this.readAt,
    this.createdAt,
  });

  factory NotificationDto.fromJson(Map<String, dynamic> json) {
    return _$NotificationDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NotificationDtoToJson(this);
}
