import 'package:json_annotation/json_annotation.dart';

import 'notification_dto.dart';

part 'list_all_patient_notification_response_dto.g.dart';

@JsonSerializable()
class ListAllPatientNotificationResponseDto {
  List<NotificationDto>? notifications;

  ListAllPatientNotificationResponseDto({this.notifications});

  factory ListAllPatientNotificationResponseDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$ListAllPatientNotificationResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ListAllPatientNotificationResponseDtoToJson(this);
  }
}
