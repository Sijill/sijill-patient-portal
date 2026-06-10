import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

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
  static Future<void> showRepeatedNotification() async {
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
      1,
      'Repeated Notification',
      'Body of the repeated notification',
      RepeatInterval.everyMinute,
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
  static Future<void> showDailyScheduledNotification() async {
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
    print('current time: ${currentTime.hour}:${currentTime.minute}');

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
      3,
      'Daily Scheduled Notification',
      'Body of the daily scheduled notification',
      payload: 'Flutter Local Notification Payload',
      scheduledTime,
      // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exact,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
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
