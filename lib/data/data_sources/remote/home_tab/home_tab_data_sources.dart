import 'package:sijil_patient_portal/domain/entities/home_tab/response/home_reminder_counters_response/home_reminder_counters_response.dart';

abstract class HomeTabDataSources {
  Future<HomeReminderCountersResponse> homeReminderCounters();
}
