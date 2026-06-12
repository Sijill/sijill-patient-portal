import 'package:json_annotation/json_annotation.dart';
import 'package:sijil_patient_portal/api/model/notfication/response/list_active_patient_reminders_response/appointment_dto.dart';

import 'medical_order_dto.dart';
import 'medication_dto.dart';

part 'reminder_dto.g.dart';

@JsonSerializable()
class ReminderDto {
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
  MedicationDto? medication;
  AppointmentDto? appointment;
  MedicalOrderDto? medicalOrder;

  ReminderDto({
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

  factory ReminderDto.fromJson(Map<String, dynamic> json) {
    return _$ReminderDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReminderDtoToJson(this);
}
