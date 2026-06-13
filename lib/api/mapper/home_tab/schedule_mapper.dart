import 'package:sijil_patient_portal/api/model/home_tab/response/today_schedule_response/schedule_dto.dart';
import 'package:sijil_patient_portal/domain/entities/home_tab/response/today_schedule_response/schedule.dart';

extension ScheduleMapper on ScheduleDto {
  Schedule convertToSchedule() {
    return Schedule(time: time, kind: kind, what: what);
  }
}
