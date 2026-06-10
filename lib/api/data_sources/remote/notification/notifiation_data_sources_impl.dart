import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/api/mapper/notification/list_all_patient_notification_response_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/notification/notification_read_response_mapper.dart';
import 'package:sijil_patient_portal/api/web_service.dart';
import 'package:sijil_patient_portal/data/data_sources/remote/notification/notificatin_data_source.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/list_all_patient_notification/list_all_patient_notification_response.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/notification_read_response/notification_read_response.dart';

@Injectable(as: NotificationDataSource)
class NotifiationDataSourcesImpl extends NotificationDataSource {
  WebService webService;
  NotifiationDataSourcesImpl({required this.webService});
  @override
  Future<ListAllPatientNotificationResponse> getAllPatientNotification() async {
    final getListAllPatientNotificationResponseDto = await webService
        .getListAllPatientNotification();
    //todo: ListAllPatientNotificationResponseDto=>ListAllPatientNotificationResponse
    return getListAllPatientNotificationResponseDto
        .convertToListAllPatientNotificationResponse();
  }

  @override
  Future<NotificationReadResponse> getNotificationRead({
    required String notificationId,
  }) async {
    final getNotificationReadResponseDto = await webService.getNotificationRead(
      notificationId,
    );
    //todo: getNotificationReadResponseDto=>getNotificationReadResponse
    return getNotificationReadResponseDto.convertToNotificationReadResponse();
  }
}
