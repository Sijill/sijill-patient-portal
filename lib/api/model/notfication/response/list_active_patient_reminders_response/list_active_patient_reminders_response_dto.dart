import 'package:json_annotation/json_annotation.dart';

import 'grouped_dto.dart';
import 'reminder_dto.dart';

part 'list_active_patient_reminders_response_dto.g.dart';

@JsonSerializable()
class ListActivePatientRemindersResponseDto {
  List<ReminderDto>? reminders;
  GroupedDto? grouped;

  ListActivePatientRemindersResponseDto({this.reminders, this.grouped});

  factory ListActivePatientRemindersResponseDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$ListActivePatientRemindersResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ListActivePatientRemindersResponseDtoToJson(this);
  }
}
