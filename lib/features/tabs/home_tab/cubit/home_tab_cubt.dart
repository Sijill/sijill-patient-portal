import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/core/exceptions/app_exception.dart';
import 'package:sijil_patient_portal/domain/use_cases/home_tab/home_reminder_counters_use_case.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/home_tab_state.dart';

@injectable
class HomeTabCubt extends Cubit<HomeTabState> {
  HomeReminderCountersUseCase homeReminderCountersUseCase;
  HomeTabCubt({required this.homeReminderCountersUseCase})
    : super(HomeTabIntialState());
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

  List<String> notificationItem = [
    "All",
    "Medications",
    "Appointments",
    "Medical Orders",
  ];
  int selectItemFromNotification = 0;
  void tabBarClick(int index) {
    selectItemFromNotification = index;
    emit(SelectItemFromNotificationSuccessState());
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
      final homeReminderCountersResponse = await homeReminderCountersUseCase
          .invoke();
      emit(
        GetHomeReminderCountersSuccess(
          homeReminderCountersResponse: homeReminderCountersResponse,
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
}
