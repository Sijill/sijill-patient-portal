import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/data/data_sources/remote/notification/notificatin_data_source.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/list_all_patient_notification/list_all_patient_notification_response.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/notification_read_response/notification_read_response.dart';
import 'package:sijil_patient_portal/domain/repositories/notification/notification_repository.dart';

@Injectable(as: NotificationRepository)
class NotificationRepositoryImpl extends NotificationRepository {
  NotificationDataSource notificationDataSource;
  NotificationRepositoryImpl({required this.notificationDataSource});
  @override
  Future<ListAllPatientNotificationResponse> getAllPatientNotification() {
    return notificationDataSource.getAllPatientNotification();
  }

  @override
  Future<NotificationReadResponse> getNotificationRead({
    required String notificationId,
  }) {
    return notificationDataSource.getNotificationRead(
      notificationId: notificationId,
    );
  }
}
