import 'package:sijil_patient_portal/domain/entities/home_tab/response/home_reminder_counters_response/home_reminder_counters_response.dart';
import 'package:sijil_patient_portal/domain/entities/home_tab/response/today_schedule_response/today_schedule_response.dart';

abstract class HomeTabState {}

class HomeTabIntialState extends HomeTabState {}

class SelectItemState extends HomeTabState {}

class ChangeSelectItemState extends HomeTabState {}

class ChoiceMultipleValueSuccessState extends HomeTabState {}

class SelectItemFromNotificationSuccessState extends HomeTabState {}

class SelectItemFromRemindersSuccessState extends HomeTabState {}

class ChangeTimeSuccessState extends HomeTabState {}

class ChangeMedicationDaysState extends HomeTabState {}

class GetHomeReminderCountersLoading extends HomeTabState {}

class GetHomeReminderCountersSuccess extends HomeTabState {
  HomeReminderCountersResponse homeReminderCountersResponse;
  GetHomeReminderCountersSuccess({required this.homeReminderCountersResponse});
}

class GetHomeReminderCountersError extends HomeTabState {
  String message;
  GetHomeReminderCountersError({required this.message});
}

class GetTodayScheduleLoading extends HomeTabState {}

class GetTodayScheduleSuccess extends HomeTabState {
  TodayScheduleResponse todayScheduleResponse;
  GetTodayScheduleSuccess({required this.todayScheduleResponse});
}

class GetTodayScheduleError extends HomeTabState {
  String message;
  GetTodayScheduleError({required this.message});
}
