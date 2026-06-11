import 'package:sijil_patient_portal/domain/entities/notfication/response/list_active_patient_remiders_response/appointment.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/list_active_patient_remiders_response/medical_order.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/list_active_patient_remiders_response/medication.dart';

class Reminder {
  String? reminderId;
  String? reminderType;
  DateTime? startsAt;
  dynamic endsAt;
  dynamic appointmentAt;
  String? reminderTime;
  dynamic customDays;
  bool? isActive;
  dynamic dismissedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  Medication? medication;
  Appointment? appointment;
  MedicalOrder? medicalOrder;

  Reminder({
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
    this.appointment,
    this.medicalOrder,
  });
}
