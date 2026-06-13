// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:sijil_patient_portal/api/notifications/local_notification_service.dart';
// import 'package:workmanager/workmanager.dart';

// class WorkMangerService {
//todo:init work manager
//   static Future<void> init() async {
//     await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
//     registerPeriodicTask();
//   }

//todo:register periodic task
//   static void registerPeriodicTask() {
//     Workmanager().registerPeriodicTask(
//       'id1',
//       'show_notification',
//       frequency: Duration(minutes: 15),
//     );
//   }

//   //todo:cancel task
//   void cancelAllTasks(String taskId) {
//     Workmanager().cancelByUniqueName(taskId);
//   }
// }

// //todo:callback show notification
// @pragma('vm:entry-point')
// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     return Future.value(true);
//   });
// }

// void listenToNotification() {
//   LocalNotificationService.streamController.stream.listen((details) {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => NotificationDetailsScreen(details: details),
//       ),
//     );
//   });
// }
