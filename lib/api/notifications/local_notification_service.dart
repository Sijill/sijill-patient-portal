import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

enum ReminderPriority { stat, urgent, routine }

class LocalNotificationService {
  static int _notificationId = 0;
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> streamController =
      StreamController();
  static void onTap(NotificationResponse details) {
    streamController.add(details);
  }

  static Future<void> init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );
  }

  //todo: Basic notification
  static Future<void> showBasicNotification({
    required String title,
    required String message,
  }) async {
    // final http.Response image = await http.get(
    //   Uri.parse(message.notification?.android?.imageUrl ?? ''),
    // );
    // BigPictureStyleInformation bigPictureStyleInformation =
    //     BigPictureStyleInformation(
    //       ByteArrayAndroidBitmap.fromBase64String(
    //         base64Encode(image.bodyBytes),
    //       ),
    //       largeIcon: ByteArrayAndroidBitmap.fromBase64String(
    //         base64Encode(image.bodyBytes),
    //       ),
    //     );
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'id1',
        'basic_notification',
        importance: Importance.max,
        priority: Priority.high,
        // styleInformation: bigPictureStyleInformation,
      ),
      iOS: DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.show(
      _notificationId++,
      title,
      message,
      notificationDetails,
    );
  }

  //todo: Repeated notification
  static Future<void> showRepeatedNotification({
    required String title,
    required String message,
    required RepeatInterval repeatInterval,
  }) async {
    NotificationDetails notificationDetails = const NotificationDetails(
      android: AndroidNotificationDetails(
        'id2',
        'repeated_notification',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
      _notificationId++,
      title,
      message,
      repeatInterval,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      notificationDetails,
      payload: 'Flutter Local Notification Payload',
    );
  }

  //todo: Scheduled notification
  static Future<void> showScheduledNotification() async {
    NotificationDetails notificationDetails = const NotificationDetails(
      android: AndroidNotificationDetails(
        'id3',
        'scheduled_notification',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );
    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      'Scheduled Notification',
      'Body of the scheduled notification',
      payload: 'Flutter Local Notification Payload',

      // tz.TZDateTime(tz.local, 2026, 6, 8, 18, 32),
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exact,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  //todo: Daily Scheduled notification
  static Future<void> showDailyScheduledNotification({
    required String title,
    required String message,
  }) async {
    NotificationDetails notificationDetails = const NotificationDetails(
      android: AndroidNotificationDetails(
        'id4',
        'daily_scheduled_notification',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );
    tz.initializeTimeZones();
    // tz.setLocalLocation(tz.getLocation('AAfrica/Cairo'));
    var currentTime = tz.TZDateTime.now(tz.local);

    var scheduledTime = tz.TZDateTime(
      tz.local,
      currentTime.year,
      currentTime.month,
      currentTime.day,
      currentTime.hour,
      3,
    );
    if (scheduledTime.isBefore(currentTime)) {
      scheduledTime = scheduledTime.add(const Duration(hours: 1));
    }

    await flutterLocalNotificationsPlugin.zonedSchedule(
      _notificationId++,
      title,
      message,
      payload: 'Flutter Local Notification Payload',
      scheduledTime,
      // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exact,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  //todo:Schedule Date & Time
  static Future<void> scheduleMedicationReminderDateAndTime({
    required String reminderId,
    required String reminderTime,
    required String medicationName,
    required List<int>? customDays, // null = everyday
  }) async {
    // cancel old
    await flutterLocalNotificationsPlugin.cancel(reminderId.hashCode);

    final now = DateTime.now();
    final timeParts = reminderTime.split(':');

    // base time = today with reminder time
    final baseTime = DateTime(
      now.year,
      now.month,
      now.day,
      int.parse(timeParts[0]),
      int.parse(timeParts[1]),
      int.parse(timeParts[2]),
    );

    // =========================
    // EVERYDAY
    // =========================
    if (customDays == null) {
      final scheduled = baseTime.isBefore(now)
          ? baseTime.add(const Duration(days: 1))
          : baseTime;

      await flutterLocalNotificationsPlugin.zonedSchedule(
        reminderId.hashCode,
        "Medication Reminder",
        "Take $medicationName",
        tz.TZDateTime.from(scheduled, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'medication_channel',
            'Medications',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    }
    // =========================
    // CUSTOM DAYS
    // =========================
    else {
      for (final day in customDays) {
        DateTime scheduledDate = baseTime;

        // move to next valid weekday
        while (scheduledDate.weekday != day) {
          scheduledDate = scheduledDate.add(const Duration(days: 1));
        }

        // avoid past time on same day
        if (scheduledDate.isBefore(now)) {
          scheduledDate = scheduledDate.add(const Duration(days: 7));
        }

        await flutterLocalNotificationsPlugin.zonedSchedule(
          (reminderId + day.toString()).hashCode,
          "Medication Reminder",
          "Take $medicationName",
          tz.TZDateTime.from(scheduledDate, tz.local),
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'medication_channel',
              'Medications',
              importance: Importance.max,
              priority: Priority.high,
            ),
          ),
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
        );
      }
    }
  }

  //todo:Scedule Repeat reminders (STAT,ROUTINE,URGENT)
  static Future<void> scheduleMedicalOrderReminder({
    required String reminderId,
    required String orderName,
    required String priority,
    required String reminderTime,
  }) async {
    for (int i = 0; i < 100; i++) {
      await flutterLocalNotificationsPlugin.cancel('$reminderId$i'.hashCode);
    }

    final now = DateTime.now();

    final timeParts = reminderTime.split(':');

    DateTime firstDate = DateTime(
      now.year,
      now.month,
      now.day,
      int.parse(timeParts[0]),
      int.parse(timeParts[1]),
      int.parse(timeParts[2]),
    );

    Duration interval;

    switch (priority.toUpperCase()) {
      case 'STAT':
        interval = const Duration(hours: 3);
        break;

      case 'URGENT':
        interval = const Duration(hours: 10);
        break;

      case 'ROUTINE':
      default:
        interval = const Duration(days: 1);
        break;
    }

    if (firstDate.isBefore(now)) {
      firstDate = firstDate.add(interval);
    }

    for (int i = 0; i < 30; i++) {
      final scheduledDate = firstDate.add(
        Duration(seconds: interval.inSeconds * i),
      );

      await flutterLocalNotificationsPlugin.zonedSchedule(
        '$reminderId$i'.hashCode,
        'Medical Order Reminder',
        'Please complete $orderName',
        tz.TZDateTime.from(scheduledDate, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'medical_order_channel',
            'Medical Orders',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    }
  }

  //todo: Cancel notification
  static Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  //todo: CancelAll notification
  static Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
