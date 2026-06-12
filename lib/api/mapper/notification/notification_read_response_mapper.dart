import 'package:sijil_patient_portal/api/mapper/notification/notification_mapper.dart';
import 'package:sijil_patient_portal/api/model/notfication/response/notification_read_response/notification_read_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/notification_read_response/notification_read_response.dart';

extension NotificationReadResponseMapper on NotificationReadResponseDto {
  NotificationReadResponse convertToNotificationReadResponse() {
    return NotificationReadResponse(
      notification: notification?.convertToNotification(),
    );
  }
}
