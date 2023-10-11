import 'package:close_frontend/services/notifications_service/notification.dart';

abstract class NotificationService{
  Future<void> init();
  void listenBackground(void Function(Notification) func);
  void listenForeground(void Function(Notification) func);
  Future<String> getNotificationDeviceId();
}