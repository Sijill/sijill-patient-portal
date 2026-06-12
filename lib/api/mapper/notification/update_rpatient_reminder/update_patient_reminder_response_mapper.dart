import 'package:sijil_patient_portal/api/mapper/notification/update_rpatient_reminder/reminder_patient_mapper.dart';
import 'package:sijil_patient_portal/api/model/notfication/response/update_patient_reminders_response/update_patient_reminders_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/update_patient_reminders_response/update_patient_reminders_response.dart';

extension UpdatePatientReminderResponseMapper
    on UpdatePatientRemindersResponseDto {
  UpdatePatientRemindersResponse convertToUpdatePatientRemindersResponse() {
    return UpdatePatientRemindersResponse(
      reminder: reminder?.convertToReminderPatient(),
    );
  }
}
