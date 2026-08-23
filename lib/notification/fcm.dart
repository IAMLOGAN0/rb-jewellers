import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

late final fCMToken;

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('body: ${message.notification?.body}');
  print('payload: ${message.data}');
}

class FirebaseApi {
  // final _firebasemessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    // await firebasemessaging.requestPermission();
    fCMToken = await firebasemessaging.getToken();
    print('TOKEN:=== $fCMToken');

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('fcm-token', '$fCMToken');

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  void isDeviceTokenRefresh() async {
    firebasemessaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }
}
