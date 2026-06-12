import 'package:json_annotation/json_annotation.dart';

import 'reminder_patient_dto.dart';

part 'update_patient_reminders_response_dto.g.dart';

@JsonSerializable()
class UpdatePatientRemindersResponseDto {
  ReminderPatientDto? reminder;

  UpdatePatientRemindersResponseDto({this.reminder});

  factory UpdatePatientRemindersResponseDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$UpdatePatientRemindersResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdatePatientRemindersResponseDtoToJson(this);
  }
}
