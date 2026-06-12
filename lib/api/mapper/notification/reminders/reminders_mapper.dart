import 'package:sijil_patient_portal/api/mapper/notification/reminders/appointments_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/notification/reminders/medical_orders_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/notification/reminders/medications_mapper.dart';
import 'package:sijil_patient_portal/api/model/notfication/response/list_active_patient_reminders_response/reminder_dto.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/list_active_patient_remiders_response/reminder.dart';

extension RemindersMapper on ReminderDto {
  Reminder convertToReminder() {
    return Reminder(
      appointment: appointment?.convertToAppointment(),
      appointmentAt: appointmentAt,
      createdAt: createdAt,
      customDays: customDays,
      dismissedAt: dismissedAt,
      endsAt: endsAt,
      isActive: isActive,
      medicalOrder: medicalOrder?.convertToMedicalOrder(),
      medication: medication?.convertToMedication(),
      reminderId: reminderId,
      reminderTime: reminderTime,
      reminderType: reminderType,
      startsAt: startsAt,
      updatedAt: updatedAt,
    );
  }
}
