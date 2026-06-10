import 'package:sijil_patient_portal/domain/entities/notfication/response/list_all_patient_notification/list_all_patient_notification_response.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/notification_read_response/notification_read_response.dart';

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
