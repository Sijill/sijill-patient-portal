import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/request/update_patient_reminder_request/update_patient_reminder_request.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/update_patient_reminders_response/update_patient_reminders_response.dart';
import 'package:sijil_patient_portal/domain/repositories/notification/notification_repository.dart';

@injectable
class UpdatePatientRemindersUseCase {
  NotificationRepository notificationRepository;
  UpdatePatientRemindersUseCase({required this.notificationRepository});

  Future<UpdatePatientRemindersResponse> invoke({
    required String reminderId,
    required UpdatePatientReminderRequest updatePatientReminderRequest,
  }) {
    return notificationRepository.updatePatientReminders(
      reminderId: reminderId,
      updatePatientReminderRequest: updatePatientReminderRequest,
    );
  }
}
