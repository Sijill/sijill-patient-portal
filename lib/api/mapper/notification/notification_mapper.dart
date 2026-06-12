import 'package:sijil_patient_portal/api/model/notfication/response/list_all_patient_notification_response/notification_dto.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/list_all_patient_notification/notification.dart';

extension NotificationMapper on NotificationDto {
  Notification convertToNotification() {
    return Notification(
      createdAt: createdAt,
      message: message,
      notificationId: notificationId,
      notificationType: notificationType,
      scheduledFor: scheduledFor,
      readAt: readAt,
      reminderId: reminderId,
      status: status,
      title: title,
      sentAt: sentAt,
    );
  }
}
