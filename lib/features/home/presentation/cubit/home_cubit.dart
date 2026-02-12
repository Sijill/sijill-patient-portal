import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/features/home/presentation/cubit/home_state.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/presentation/screen/health_journal_tab.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/screen/home_tab.dart';
import 'package:sijil_patient_portal/features/tabs/medical_history/presentation/screen/medical_history_tab.dart';
import 'package:sijil_patient_portal/features/tabs/profile/presentation/screen/profile_tab.dart';
import 'package:sijil_patient_portal/features/tabs/settings/presentation/screen/settings_tab.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeIntialState());

  int selectIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    ProfileTab(),
    HealthJournalTab(),
    MedicalHistoryTab(),
    SettingsTab(),
  ];

  void changeTap(int index) {
    selectIndex = index;
    emit(HomeChangeTabState());
  }
}
