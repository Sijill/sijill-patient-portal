import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/list_active_patient_remiders_response/list_active_patient_remiders_response.dart';
import 'package:sijil_patient_portal/domain/repositories/notification/notification_repository.dart';

@injectable
class ListActivePatientRemindersUseCase {
  NotificationRepository notificationRepository;
  ListActivePatientRemindersUseCase({required this.notificationRepository});

  Future<ListActivePatientRemidersResponse> invoke() {
    return notificationRepository.getListActivePatientReminders();
  }
}
