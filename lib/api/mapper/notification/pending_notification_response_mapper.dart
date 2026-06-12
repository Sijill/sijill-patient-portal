import 'package:sijil_patient_portal/api/mapper/notification/notification_mapper.dart';
import 'package:sijil_patient_portal/api/model/notfication/response/pending_notification_response/pending_notification_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/pending_notification_response/pending_notification_response.dart';

extension PendingNotificationResponseMapper on PendingNotificationResponseDto {
  PendingNotificationResponse convertToPendingNotificationResponse() {
    return PendingNotificationResponse(
      notifications: notifications
          ?.map((e) => e.convertToNotification())
          .toList(),
    );
  }
}
