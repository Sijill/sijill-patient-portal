import 'dart:async';

import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/api/notifications/local_notification_service.dart';
import 'package:sijil_patient_portal/core/cache/shared_prefs_utils.dart';
import 'package:sijil_patient_portal/core/exceptions/app_exception.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/request/update_patient_reminder_request/update_patient_reminder_request.dart';
import 'package:sijil_patient_portal/domain/entities/notfication/response/list_active_patient_remiders_response/list_active_patient_remiders_response.dart';
import 'package:sijil_patient_portal/domain/use_cases/notification/list_active_patient_reminders_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/notification/list_all_patient_notification_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/notification/notification_read_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/notification/peanding_notification_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/notification/update_patient_reminders_use_case.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/notifcaton_state.dart';

@lazySingleton
class NotificationCubit extends Cubit<NotifcatonState> {
  ListAllPatientNotificationUseCase listAllPatientNotificationUseCase;
  ListActivePatientRemindersUseCase listActivePatientRemindersUseCase;
  NotificationReadUseCase notificationReadUseCase;
  PeandingNotificationUseCase peandingNotificationUseCase;
  UpdatePatientRemindersUseCase updatePatientRemindersUseCase;

  NotificationCubit({
    required this.listAllPatientNotificationUseCase,
    required this.notificationReadUseCase,
    required this.listActivePatientRemindersUseCase,
    required this.peandingNotificationUseCase,
    required this.updatePatientRemindersUseCase,
  }) : super(NotifcatonIniialState());

  List<dynamic> allNotifications = [];
  List<dynamic> filteredNotifications = [];

  ListActivePatientRemidersResponse? remindersResponse;

  List<String> readMessage = ["ALL", "READ", "UNREAD"];

  int selectIndexFromReadMessage = 0;
  void changeSelectIndexFromReadMessage(int index) {
    selectIndexFromReadMessage = index;
    emit(SelectItemFromReadMessageSuccessState());
  }

  Future<void> getListAllPatientNotification() async {
    try {
      emit(GetListAllPatentNotificatinLoading());

      final response = await listAllPatientNotificationUseCase.invoke();

      allNotifications = response.notifications ?? [];
      filteredNotifications = List.from(allNotifications);

      // final notifications = response.notifications ?? [];

      //todo:Previously viewed notifications
      // List<String> shownNotifications =
      //     SharedPrefsUtils.getStringList(key: 'shown_notifications') ?? [];

      // for (final notification in notifications) {
      //   final notificationId = notification.notificationId;

      //   if (notificationId == null) continue;

      //   if (!shownNotifications.contains(notificationId)) {
      //     await LocalNotificationService.showBasicNotification(
      //       title: notification.title ?? '',
      //       message: notification.message ?? '',
      //     );
      //     shownNotifications.add(notificationId);

      //     await Future.delayed(const Duration(milliseconds: 500));
      //   }
      // }
      // await SharedPrefsUtils.saveData(
      //   key: 'shown_notifications',
      //   value: shownNotifications,
      // );

      emit(
        GetListAllPatentNotificatinSuccess(
          listAllPatientNotificationResponse: response,
        ),
      );
    } on AppException catch (e) {
      emit(GetListAllPatentNotificatinError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexpected error occurred";

      emit(GetListAllPatentNotificatinError(message: message));
    } catch (e) {
      emit(GetListAllPatentNotificatinError(message: e.toString()));
    }
  }

  void filterNotifications(int tabIndex) {
    switch (tabIndex) {
      case 1: // Read
        filteredNotifications = allNotifications
            .where((e) => e.readAt != null)
            .toList();
        break;

      case 2: // Unread
        filteredNotifications = allNotifications
            .where((e) => e.readAt == null)
            .toList();
        break;

      default: // All
        filteredNotifications = List.from(allNotifications);
    }

    emit(NotificationFilterChanged());
  }

  void resetReadMessageTab() {
    selectIndexFromReadMessage = 0;
    filteredNotifications = List.from(allNotifications);
    emit(NotificationFilterChanged());
  }

  Future<void> getNotificationRead({required String notificationId}) async {
    try {
      emit(UpdatePatientRemindersLoading());
      final response = await notificationReadUseCase.invoke(notificationId);

      emit(GetNotificationReadSuccess(notificationReadResponse: response));
    } on AppException catch (e) {
      emit(GetNotificationReadError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(GetNotificationReadError(message: message));
    } catch (e) {
      emit(GetNotificationReadError(message: e.toString()));
    }
  }

  Future<void> getListActivePatientReminders() async {
    try {
      emit(GetListActivePatientRemindersLoading());
      final response = await listActivePatientRemindersUseCase.invoke();
      remindersResponse = response;

      medicationDays.clear();
      medicationTimes.clear();

      final reminders = response.reminders ?? [];
      int index = 0;

      for (final reminder in reminders) {
        if (reminder.medication == null) continue;

        final customDays = reminder.customDays;

        if (customDays == null) {
          medicationDays[index] = List.from(days); // Every Day
        } else {
          medicationDays[index] = (customDays as List)
              .map((e) => days[(e as int) - 1])
              .toList();
        }

        //todo: Time
        final reminderTime = reminder.reminderTime;

        if (reminderTime != null) {
          final parts = reminderTime.split(':');

          medicationTimes[index] = Time(
            hour: int.parse(parts[0]),
            minute: int.parse(parts[1]),
          );
        }

        index++;
      }
      await Future.wait(
        reminders
            .where((r) => r.reminderTime != null)
            .map(
              (reminder) =>
                  LocalNotificationService.scheduleMedicalOrderReminder(
                    reminderId: reminder.reminderId.toString(),
                    orderName: reminder.medication?.name ?? 'Medication',
                    priority: reminder.medicalOrder?.priority ?? 'ROUTINE',
                    reminderTime: reminder.reminderTime!,
                  ),
            ),
      );
      emit(
        GetListActivePatientRemindersSuccess(
          listActivePatientRemidersResponse: response,
        ),
      );
    } on AppException catch (e) {
      emit(GetListActivePatientRemindersError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(GetListActivePatientRemindersError(message: message));
    } catch (e) {
      emit(GetListActivePatientRemindersError(message: e.toString()));
    }
  }

  List<String> days = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"];

  /// DATA SOURCE
  Map<int, List<String>> medicationDays = {};
  Map<int, List<String>> tempMedicationDays = {};
  Map<int, Time> medicationTimes = {};

  Time getMedicationTime(int index) {
    return medicationTimes[index] ?? Time(hour: 4, minute: 30);
  }

  void changeMedicationTime({required int index, required Time newTime}) {
    medicationTimes[index] = newTime;
    emit(ChangeTimeSuccessState());
  }

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

  String formatReminderTime(Time time) {
    return '${time.hour.toString().padLeft(2, '0')}:'
        '${time.minute.toString().padLeft(2, '0')}:00';
  }

  Future<void> updatePatientReminders({
    required String reminderId,
    required UpdatePatientReminderRequest updatePatientReminderRequest,
  }) async {
    try {
      emit(UpdatePatientRemindersLoading());
      final updatePatientRemindersResponse = await updatePatientRemindersUseCase
          .invoke(
            reminderId: reminderId,
            updatePatientReminderRequest: updatePatientReminderRequest,
          );

      emit(
        UpdatePatientRemindersSuccess(
          updatePatientRemindersResponse: updatePatientRemindersResponse,
        ),
      );
    } on AppException catch (e) {
      emit(UpdatePatientRemindersError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(UpdatePatientRemindersError(message: message));
    } catch (e) {
      emit(UpdatePatientRemindersError(message: e.toString()));
    }
    return;
  }

  Future<void> getPendingNotifications() async {
    if (_isFetchingPending) return;

    _isFetchingPending = true;

    try {
      final response = await peandingNotificationUseCase.invoke();
      final notifications = response.notifications ?? [];

      bool hasNew = false;

      for (final notification in notifications) {
        final id = notification.notificationId;
        if (id == null) continue;

        if (!_seenNotifications.contains(id)) {
          await LocalNotificationService.showBasicNotification(
            title: notification.title ?? '',
            message: notification.message ?? '',
          );
          await Future.delayed(const Duration(milliseconds: 1200));
          _seenNotifications.add(id);
          hasNew = true;
        }
      }

      if (hasNew) {
        await SharedPrefsUtils.saveData(
          key: _pendingKey,
          value: _seenNotifications.toList(),
        );
      }
    } on AppException catch (e) {
      emit(GetPeandingNotificationError(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(GetPeandingNotificationError(message: message));
    } catch (e) {
      emit(GetPeandingNotificationError(message: e.toString()));
    } finally {
      _isFetchingPending = false;
    }
  }

  Timer? _pendingTimer;
  bool _isFetchingPending = false;

  static const String _pendingKey = 'pending_notifications';
  Set<String> _seenNotifications = {};

  void startPendingNotificationsPolling({
    Duration interval = const Duration(seconds: 40),
  }) {
    _pendingTimer?.cancel();

    _seenNotifications =
        (SharedPrefsUtils.getStringList(key: _pendingKey) ?? []).toSet();

    _pendingTimer = Timer.periodic(interval, (_) {
      getPendingNotifications();
    });
  }

  void stopPendingNotificationsPolling() {
    _pendingTimer?.cancel();
    _pendingTimer = null;
  }

  @override
  Future<void> close() {
    _pendingTimer?.cancel();
    return super.close();
  }
}
