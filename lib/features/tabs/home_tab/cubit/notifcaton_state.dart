import 'package:sijil_patient_portal/domain/entities/notfication/response/list_active_patient_remiders_response/list_active_patient_remiders_response.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/list_all_patient_notification/list_all_patient_notification_response.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/notification_read_response/notification_read_response.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/pending_notification_response/pending_notification_response.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/update_patient_reminders_response/update_patient_reminders_response.dart';

abstract class NotifcatonState {}

class NotifcatonIniialState extends NotifcatonState {}

class GetListAllPatentNotificatinLoading extends NotifcatonState {}

class GetListAllPatentNotificatinSuccess extends NotifcatonState {
  ListAllPatientNotificationResponse listAllPatientNotificationResponse;
  GetListAllPatentNotificatinSuccess({
    required this.listAllPatientNotificationResponse,
  });
}

class GetListAllPatentNotificatinError extends NotifcatonState {
  String message;
  GetListAllPatentNotificatinError({required this.message});
}

class SelectItemFromReadMessageSuccessState extends NotifcatonState {}

class NotificationFilterChanged extends NotifcatonState {}

class GetNotificationReadLoading extends NotifcatonState {}

class GetNotificationReadSuccess extends NotifcatonState {
  NotificationReadResponse notificationReadResponse;
  GetNotificationReadSuccess({required this.notificationReadResponse});
}

class GetNotificationReadError extends NotifcatonState {
  String message;
  GetNotificationReadError({required this.message});
}

class GetListActivePatientRemindersLoading extends NotifcatonState {}

class GetListActivePatientRemindersSuccess extends NotifcatonState {
  ListActivePatientRemidersResponse listActivePatientRemidersResponse;
  GetListActivePatientRemindersSuccess({
    required this.listActivePatientRemidersResponse,
  });
}

class GetListActivePatientRemindersError extends NotifcatonState {
  String message;
  GetListActivePatientRemindersError({required this.message});
}

class ChangeMedicationDaysState extends NotifcatonState {}

class ChangeTimeSuccessState extends NotifcatonState {}

class GetPeandingNotificationLoading extends NotifcatonState {}

class GetPeandingNotificationSuccess extends NotifcatonState {
  PendingNotificationResponse pendingNotificationRespons;
  GetPeandingNotificationSuccess({required this.pendingNotificationRespons});
}

class GetPeandingNotificationError extends NotifcatonState {
  String message;
  GetPeandingNotificationError({required this.message});
}

class UpdatePatientRemindersLoading extends NotifcatonState {}

class UpdatePatientRemindersSuccess extends NotifcatonState {
  UpdatePatientRemindersResponse updatePatientRemindersResponse;
  UpdatePatientRemindersSuccess({required this.updatePatientRemindersResponse});
}

class UpdatePatientRemindersError extends NotifcatonState {
  String message;
  UpdatePatientRemindersError({required this.message});
}
