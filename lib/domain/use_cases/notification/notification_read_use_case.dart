import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/notification_read_response/notification_read_response.dart';
import 'package:sijil_patient_portal/domain/repositories/notification/notification_repository.dart';

@injectable
class NotificationReadUseCase {
  NotificationRepository notificationRepository;
  NotificationReadUseCase({required this.notificationRepository});

  Future<NotificationReadResponse> invoke(String notificationId) {
    return notificationRepository.getNotificationRead(
      notificationId: notificationId,
    );
  }
}
