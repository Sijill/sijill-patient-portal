import 'package:sijil_patient_portal/api/mapper/notification/update_rpatient_reminder/medication_patient_mapper.dart';
import 'package:sijil_patient_portal/api/model/notfication/response/update_patient_reminders_response/reminder_patient_dto.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/update_patient_reminders_response/reminder_patient.dart';

extension ReminderPatientMapper on ReminderPatientDto {
  ReminderPatient convertToReminderPatient() {
    return ReminderPatient(
      appointmentAt: appointmentAt,
      createdAt: createdAt,
      customDays: customDays,
      dismissedAt: dismissedAt,
      endsAt: endsAt,
      isActive: isActive,
      medication: medication?.convertToMedicationPatient(),
      reminderId: reminderId,
      reminderTime: reminderTime,
      reminderType: reminderType,
      startsAt: startsAt,
      updatedAt: updatedAt,
    );
  }
}
