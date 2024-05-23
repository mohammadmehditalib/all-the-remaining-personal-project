import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();

    final fcmToken = await _firebaseMessaging.getToken();
    print(fcmToken);
    FirebaseMessaging.onBackgroundMessage((message) => functionmessage(message));
  }

  Future functionmessage(RemoteMessage message) async {
    print(message.data);
  }
}
