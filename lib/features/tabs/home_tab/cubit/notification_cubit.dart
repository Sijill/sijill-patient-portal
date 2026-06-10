import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/api/notifications/local_notification_service.dart';
import 'package:sijil_patient_portal/core/cache/shared_prefs_utils.dart';
import 'package:sijil_patient_portal/core/exceptions/app_exception.dart';
import 'package:sijil_patient_portal/domain/use_cases/notification/list_all_patient_notification_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/notification/notification_read_use_case.dart';
import 'package:sijil_patient_portal/features/tabs/home_tab/cubit/notifcaton_state.dart';

@injectable
class NotificationCubit extends Cubit<NotifcatonState> {
  ListAllPatientNotificationUseCase listAllPatientNotificationUseCase;
  NotificationReadUseCase notificationReadUseCase;

  NotificationCubit({
    required this.listAllPatientNotificationUseCase,
    required this.notificationReadUseCase,
  }) : super(NotifcatonIniialState());

  List<dynamic> allNotifications = [];
  List<dynamic> filteredNotifications = [];

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

      final notifications = response.notifications ?? [];

      //todo:Previously viewed notifications
      List<String> shownNotifications =
          SharedPrefsUtils.getStringList(key: 'shown_notifications') ?? [];

      for (final notification in notifications) {
        final notificationId = notification.notificationId;

        if (notificationId == null) continue;

        if (!shownNotifications.contains(notificationId)) {
          await LocalNotificationService.showBasicNotification(
            title: notification.title ?? '',
            message: notification.message ?? '',
          );
          shownNotifications.add(notificationId);

          await Future.delayed(const Duration(milliseconds: 500));
        }
      }
      await SharedPrefsUtils.saveData(
        key: 'shown_notifications',
        value: shownNotifications,
      );

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
      emit(GetNotificationReadLoading());
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
    return;
  }
}
