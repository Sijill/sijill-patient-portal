import 'package:sijil_patient_portal/domain/entities/notfication/response/update_patient_reminders_response/medication_patient.dart';

class ReminderPatient {
  String? reminderId;
  String? reminderType;
  DateTime? startsAt;
  dynamic endsAt;
  dynamic appointmentAt;
  String? reminderTime;
  List<int>? customDays;
  bool? isActive;
  dynamic dismissedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  MedicationPatient? medication;

  ReminderPatient({
    this.reminderId,
    this.reminderType,
    this.startsAt,
    this.endsAt,
    this.appointmentAt,
    this.reminderTime,
    this.customDays,
    this.isActive,
    this.dismissedAt,
    this.createdAt,
    this.updatedAt,
    this.medication,
  });
}
