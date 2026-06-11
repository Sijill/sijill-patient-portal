import 'package:sijil_patient_portal/domain/entities/notfication/response/list_active_patient_remiders_response/grouped.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/list_active_patient_remiders_response/reminder.dart';

class ListActivePatientRemidersResponse {
  List<Reminder>? reminders;
  Grouped? grouped;

  ListActivePatientRemidersResponse({this.reminders, this.grouped});
}
