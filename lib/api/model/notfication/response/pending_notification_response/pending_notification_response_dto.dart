import 'package:json_annotation/json_annotation.dart';
import 'package:sijil_patient_portal/api/model/notfication/response/list_all_patient_notification_response/notification_dto.dart';

part 'pending_notification_response_dto.g.dart';

@JsonSerializable()
class PendingNotificationResponseDto {
  List<NotificationDto>? notifications;

  PendingNotificationResponseDto({this.notifications});

  factory PendingNotificationResponseDto.fromJson(Map<String, dynamic> json) {
    return _$PendingNotificationResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PendingNotificationResponseDtoToJson(this);
  }
}
