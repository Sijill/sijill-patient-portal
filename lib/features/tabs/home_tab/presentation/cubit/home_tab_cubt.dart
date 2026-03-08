import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/cubit/home_tab_state.dart';

@injectable
class HomeTabCubt extends Cubit<HomeTabState> {
  HomeTabCubt() : super(HomeTabIntialState());
  late String selectItem;
  void changeSelectItem(String item) {
    selectItem = item;
    emit(SelectItemState());
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

  bool isAllTasksCompleted(int totalTasks) {
    return choiceValue.length == totalTasks;
  }
}
