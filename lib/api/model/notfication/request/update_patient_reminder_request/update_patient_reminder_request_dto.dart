import 'package:json_annotation/json_annotation.dart';

part 'update_patient_reminder_request_dto.g.dart';

@JsonSerializable()
class UpdatePatientReminderRequestDto {
  String? reminderTime;
  List<int>? customDays;

  UpdatePatientReminderRequestDto({this.reminderTime, this.customDays});

  factory UpdatePatientReminderRequestDto.fromJson(Map<String, dynamic> json) {
    return _$UpdatePatientReminderRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdatePatientReminderRequestDtoToJson(this);
  }
}
