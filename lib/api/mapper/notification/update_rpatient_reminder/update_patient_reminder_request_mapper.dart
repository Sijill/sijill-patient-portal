import 'package:sijil_patient_portal/api/model/notfication/request/update_patient_reminder_request/update_patient_reminder_request_dto.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/request/update_patient_reminder_request/update_patient_reminder_request.dart';

extension UpdatePatientReminderRequestMapper on UpdatePatientReminderRequest {
  UpdatePatientReminderRequestDto convertToUpdatePatientReminderRequestDto() {
    return UpdatePatientReminderRequestDto(
      reminderTime: reminderTime,
      customDays: customDays,
    );
  }
}
