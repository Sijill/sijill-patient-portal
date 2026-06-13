import 'package:sijil_patient_portal/api/mapper/home_tab/counters_mapper.dart';
import 'package:sijil_patient_portal/api/model/home_tab/response/home_reminder_counters_response/home_reminder_counters_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/home_tab/response/home_reminder_counters_response/home_reminder_counters_response.dart';

extension HomeReminderCountersMapper on HomeReminderCountersResponseDto {
  HomeReminderCountersResponse convertToHomeReminderCountersResponse() {
    return HomeReminderCountersResponse(
      counters: counters?.convertToCounters(),
    );
  }
}
