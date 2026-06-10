import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/home_tab_state.dart';

@injectable
class HomeTabCubt extends Cubit<HomeTabState> {
  HomeTabCubt() : super(HomeTabIntialState());
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

  Map<int, Time> medicationTimes = {};
  Time getMedicationTime(int index) {
    return medicationTimes[index] ?? Time(hour: 4, minute: 30);
  }

  void changeMedicationTime({required int index, required Time newTime}) {
    medicationTimes[index] = newTime;
    emit(ChangeTimeSuccessState());
  }

  final List<String> days = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"];

  Map<int, List<String>> medicationDays = {};

  Map<int, List<String>> tempMedicationDays = {};

  List<String> getMedicationDays(int index) {
    final sortedDays = List<String>.from(medicationDays[index] ?? []);

    sortedDays.sort((a, b) => days.indexOf(a).compareTo(days.indexOf(b)));

    return sortedDays;
  }

  void initTempDays(int index) {
    tempMedicationDays[index] = List.from(medicationDays[index] ?? []);

    emit(ChangeMedicationDaysState());
  }

  void toggleTempDay({required int index, required String day}) {
    tempMedicationDays[index] ??= [];

    if (tempMedicationDays[index]!.contains(day)) {
      tempMedicationDays[index]!.remove(day);
    } else {
      tempMedicationDays[index]!.add(day);
    }

    emit(ChangeMedicationDaysState());
  }

  void saveSelectedDays(int index) {
    medicationDays[index] = List.from(tempMedicationDays[index] ?? []);

    emit(ChangeMedicationDaysState());
  }
}
