import 'package:sijil_patient_portal/domain/entities/notfication/response/list_all_patient_notification/list_all_patient_notification_response.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/notification_read_response/notification_read_response.dart';

abstract class NotificationRepository {
  Future<ListAllPatientNotificationResponse> getAllPatientNotification();
  Future<NotificationReadResponse> getNotificationRead({
    required String notificationId,
  });
}
