import 'package:sijil_patient_portal/api/mapper/notification/notification_mapper.dart';
import 'package:sijil_patient_portal/api/model/notfication/response/list_all_patient_notification_response/list_all_patient_notification_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/list_all_patient_notification/list_all_patient_notification_response.dart';

extension ListAllPatientNotificationResponseMapper
    on ListAllPatientNotificationResponseDto {
  ListAllPatientNotificationResponse
  convertToListAllPatientNotificationResponse() {
    return ListAllPatientNotificationResponse(
      notifications: notifications
          ?.map((e) => e.convertToNotification())
          .toList(),
    );
  }
}
