import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/features/home/cubit/home_state.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/presentation/health_journal_tab.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/home_tab.dart';
import 'package:sijil_patient_portal/features/tabs/medical_history/presentation/medical_history_tab.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/presentation/medical_identity_tab.dart';
import 'package:sijil_patient_portal/features/tabs/settings/presentation/settings_tab.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeIntialState());

  int selectIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    HealthJournalTab(),
    MedicalHistoryTab(),
    MedicalIdentityTab(),
    SettingsTab(),
  ];

  void changeTap(int index) {
    selectIndex = index;
    emit(HomeChangeTabState());
  }
}
