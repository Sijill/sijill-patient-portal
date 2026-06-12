import 'package:json_annotation/json_annotation.dart';

import 'medication_patient_dto.dart';

part 'reminder_patient_dto.g.dart';

@JsonSerializable()
class ReminderPatientDto {
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
  MedicationPatientDto? medication;

  ReminderPatientDto({
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

  factory ReminderPatientDto.fromJson(Map<String, dynamic> json) {
    return _$ReminderPatientDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReminderPatientDtoToJson(this);
}
