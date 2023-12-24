import 'package:firebase_messaging/firebase_messaging.dart';

import '../../dependency_injection/injection.dart';
import 'firebase_notification_service.dart';
import 'notification_service.dart';

void initNotifications(){
  getIt.get<NotificationService>().init();
  getIt.get<NotificationService>().listenForeground();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
}