import 'package:sijil_patient_portal/api/mapper/home_tab/schedule_mapper.dart';
import 'package:sijil_patient_portal/api/model/home_tab/response/today_schedule_response/today_schedule_response_dto.dart';
import 'package:sijil_patient_portal/domain/entities/home_tab/response/today_schedule_response/today_schedule_response.dart';

extension TodayScheduleResponseMapper on TodayScheduleResponseDto {
  TodayScheduleResponse convertToTodayScheduleResponse() {
    return TodayScheduleResponse(
      schedule: schedule?.map((e) => e.convertToSchedule()).toList(),
    );
  }
}
