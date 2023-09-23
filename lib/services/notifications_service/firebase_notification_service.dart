import 'package:close_frontend/firebase_options.dart';
import 'package:close_frontend/services/notifications_service/notification.dart' as notification;
import 'package:close_frontend/services/notifications_service/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NotificationService)
class FirebaseNotificationService implements NotificationService{

  @override
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await _askPermissions();
  }

  @override
  void listenBackground(void Function(notification.Notification message) func) async  {
    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
      func(notification.Notification(title: message.notification!.title!, body: message.notification!.body!));
    });
  }

  @override
  void listenForeground(void Function(notification.Notification p1) func) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      func(notification.Notification(title: message.notification!.title!, body: message.notification!.body!));
    });  }

  Future<void> _askPermissions() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission();
  }
}