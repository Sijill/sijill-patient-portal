import 'package:sijil_patient_portal/api/mapper/notification/reminders/grouped_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/notification/reminders/reminders_mapper.dart';
import 'package:sijil_patient_portal/api/model/notfication/response/list_active_patient_reminders_response/list_active_patient_reminders_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/list_active_patient_remiders_response/list_active_patient_remiders_response.dart';

extension ListActivePatientRemindersResponseMapper
    on ListActivePatientRemindersResponseDto {
  ListActivePatientRemidersResponse
  convertToListActivePatientRemidersResponse() {
    return ListActivePatientRemidersResponse(
      grouped: grouped?.convertToGrouped(),
      reminders: reminders?.map((e) => e.convertToReminder()).toList(),
    );
  }
}
