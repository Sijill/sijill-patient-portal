import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/pending_notification_response/pending_notification_response.dart';
import 'package:sijil_patient_portal/domain/repositories/notification/notification_repository.dart';

@injectable
class PeandingNotificationUseCase {
  NotificationRepository notificationRepository;
  PeandingNotificationUseCase({required this.notificationRepository});

  Future<PendingNotificationResponse> invoke() {
    return notificationRepository.getPendingNotifications();
  }
}
