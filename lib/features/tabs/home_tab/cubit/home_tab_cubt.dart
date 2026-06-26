import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/core/exceptions/app_exception.dart';
import 'package:sijil_patient_portal/domain/entities/home_tab/response/home_reminder_counters_response/home_reminder_counters_response.dart';
import 'package:sijil_patient_portal/domain/entities/home_tab/response/patient_name/patient_name_response.dart';
import 'package:sijil_patient_portal/domain/entities/home_tab/response/today_schedule_response/today_schedule_response.dart';
import 'package:sijil_patient_portal/domain/use_cases/home_tab/home_reminder_counters_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/home_tab/patient_name_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/home_tab/today_schedule_use_case.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/home_tab_state.dart';

@injectable
class HomeTabCubt extends Cubit<HomeTabState> {
  HomeReminderCountersUseCase homeReminderCountersUseCase;
  TodayScheduleUseCase todayScheduleUseCase;
  PatientNameUseCase patientNameUseCase;
  HomeTabCubt({
    required this.homeReminderCountersUseCase,
    required this.todayScheduleUseCase,
    required this.patientNameUseCase,
  }) : super(HomeTabIntialState());

  HomeReminderCountersResponse? homeReminderCountersResponse;
  TodayScheduleResponse? todayScheduleResponse;
  PatientNameResponse? patientNameResponse;

  Map<String, String> selectedItems = {};
  void changeSelectItem({required String key, required String value}) {
    selectedItems[key] = value;
    emit(ChangeSelectItemState());
  }

  void setInitialValue({required String key, required String value}) {
    selectedItems[key] = value;
    emit(ChangeSelectItemState());
  }

  Set<int> choiceValue = {};

  void choiceMultipleValue(int index, bool value) {
    if (value) {
      choiceValue.add(index);
    } else {
      choiceValue.remove(index);
    }
    emit(ChoiceMultipleValueSuccessState());
  }

  List<String> remendersItem = [
    "Medications",
    "Medical Orders",
    "Appointments",
  ];
  int selectIndexFromReminders = 0;
  void changeSelectIndexFromReminders(int index) {
    selectIndexFromReminders = index;
    emit(SelectItemFromRemindersSuccessState());
  }

  Future<void> homeReminderCounters() async {
    try {
      emit(GetHomeReminderCountersLoading());
      homeReminderCountersResponse = await homeReminderCountersUseCase.invoke();
      emit(
        GetHomeReminderCountersSuccess(
          homeReminderCountersResponse: homeReminderCountersResponse!,
        ),
      );
    } on AppException catch (e) {
      emit(GetHomeReminderCountersError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(GetHomeReminderCountersError(message: message));
    } catch (e) {
      emit(GetHomeReminderCountersError(message: e.toString()));
    }
  }

  Future<void> getTodaySchedule() async {
    try {
      emit(GetTodayScheduleLoading());
      todayScheduleResponse = await todayScheduleUseCase.invoke();
      emit(
        GetTodayScheduleSuccess(todayScheduleResponse: todayScheduleResponse!),
      );
    } on AppException catch (e) {
      emit(GetTodayScheduleError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(GetTodayScheduleError(message: message));
    } catch (e) {
      emit(GetTodayScheduleError(message: e.toString()));
    }
  }

  Future<void> getPatientName() async {
    try {
      patientNameResponse = await patientNameUseCase.invoke();
      emit(GetPatientNameSuccess(patientNameResponse: patientNameResponse!));
    } on AppException catch (e) {
      emit(GetPatientNameError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(GetPatientNameError(message: message));
    } catch (e) {
      emit(GetPatientNameError(message: e.toString()));
    }
  }
}
