import 'package:sijil_patient_portal/api/model/home_tab/response/home_reminder_counters_response/counters_dto.dart';
import 'package:sijil_patient_portal/domain/entities/home_tab/response/home_reminder_counters_response/counters.dart';

extension CountersMapper on CountersDto {
  Counters convertToCounters() {
    return Counters(
      medicationReminders: medicationReminders,
      pendingTestOrders: pendingTestOrders,
      upcomingAppointments: upcomingAppointments,
    );
  }
}
