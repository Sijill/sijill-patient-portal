import 'package:sijil_patient_portal/domain/entities/notfication/request/update_patient_reminder_request/update_patient_reminder_request.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/list_active_patient_remiders_response/list_active_patient_remiders_response.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/list_all_patient_notification/list_all_patient_notification_response.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/notification_read_response/notification_read_response.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/pending_notification_response/pending_notification_response.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/update_patient_reminders_response/update_patient_reminders_response.dart';

abstract class NotificationRepository {
  Future<ListAllPatientNotificationResponse> getAllPatientNotification();
  Future<NotificationReadResponse> getNotificationRead({
    required String notificationId,
  });

  Future<ListActivePatientRemidersResponse> getListActivePatientReminders();

  Future<PendingNotificationResponse> getPendingNotifications();

  Future<UpdatePatientRemindersResponse> updatePatientReminders({
    required String reminderId,
    required UpdatePatientReminderRequest updatePatientReminderRequest,
  });
}
