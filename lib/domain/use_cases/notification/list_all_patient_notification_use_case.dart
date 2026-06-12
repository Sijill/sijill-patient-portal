import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/list_all_patient_notification/list_all_patient_notification_response.dart';
import 'package:sijil_patient_portal/domain/repositories/notification/notification_repository.dart';

@injectable
class ListAllPatientNotificationUseCase {
  NotificationRepository notificationRepository;
  ListAllPatientNotificationUseCase({required this.notificationRepository});

  Future<ListAllPatientNotificationResponse> invoke() {
    return notificationRepository.getAllPatientNotification();
  }
}
