import 'package:sijil_patient_portal/domain/entities/home_tab/response/home_reminder_counters_response/home_reminder_counters_response.dart';
import 'package:sijil_patient_portal/domain/entities/home_tab/response/patient_name/patient_name_response.dart';
import 'package:sijil_patient_portal/domain/entities/home_tab/response/today_schedule_response/today_schedule_response.dart';

abstract class HomeTabRepository {
  Future<HomeReminderCountersResponse> homeReminderCounters();

  Future<TodayScheduleResponse> getTodaySchedule();

  Future<PatientNameResponse> getPatientName();
}
