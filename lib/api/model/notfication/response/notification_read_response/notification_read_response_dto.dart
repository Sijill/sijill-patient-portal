import 'package:json_annotation/json_annotation.dart';
import 'package:sijil_patient_portal/api/model/notfication/response/list_all_patient_notification_response/notification_dto.dart';
part 'notification_read_response_dto.g.dart';

@JsonSerializable()
class NotificationReadResponseDto {
  NotificationDto? notification;

  NotificationReadResponseDto({this.notification});

  factory NotificationReadResponseDto.fromJson(Map<String, dynamic> json) {
    return _$NotificationReadResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NotificationReadResponseDtoToJson(this);
}
