import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/features/home/cubit/home_state.dart';
import 'package:sijil_patient_portal/features/tabs/chatbot/presentation/chatbot.dart';
import 'package:sijil_patient_portal/features/tabs/health_journal/presentation/health_journal_tab.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/notification_cubit.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/presentation/home_tab.dart';
import 'package:sijil_patient_portal/features/tabs/medical_history/presentation/medical_history_tab.dart';
import 'package:sijil_patient_portal/features/tabs/medical_identiti/presentation/medical_identity_tab.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final NotificationCubit notificationCubit;
  HomeCubit({required this.notificationCubit}) : super(HomeIntialState());

  int selectIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    HealthJournalTab(),
    MedicalHistoryTab(),
    MedicalIdentityTab(),
    Chatbot(showAppBar: false),
  ];

  void changeTap(int index) {
    selectIndex = index;
    emit(HomeChangeTabState());
  }

  Timer? _appTimer;

  void startAppPolling() {
    print('Polling Started');
    _appTimer?.cancel();

    _appTimer = Timer.periodic(const Duration(seconds: 60), (_) {
      notificationCubit.getPendingNotifications();
    });
  }

  @override
  Future<void> close() {
    _appTimer?.cancel();
    return super.close();
  }
}
