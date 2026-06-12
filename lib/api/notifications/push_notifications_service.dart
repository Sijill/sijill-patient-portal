import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:sijil_patient_portal/api/notifications/local_notification_service.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future<void> init() async {
    //todo: Request permission for iOS
    await messaging.requestPermission();

    //todo: Get the token for the device
    await messaging.getToken().then((value) {
      sendTokenToServer(value!);
    });

    //todo: Listen for token refresh
    messaging.onTokenRefresh.listen((newToken) {
      sendTokenToServer(newToken);
    });

    //todo: Push notifications when the app is in the background and terminated(killed)

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    //todo: Push notifications when the app is in the foreground
    handleForegroundMessage();
  }

  //todo: Handle the message when the app is in the background and terminated(killed)
  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    print("Handling a background message: ${message.notification?.title}");
  }

  //todo: Handle the message when the app is in the foreground
  static void handleForegroundMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //todo: Show a local notification when the app is in the foreground
      //  LocalNotificationService.showBasicNotification(message);
    });
  }

  //todo: Send the token to the server
  static void sendTokenToServer(String token) {}
}
