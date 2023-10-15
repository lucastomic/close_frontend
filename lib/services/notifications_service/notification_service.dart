import 'package:close_frontend/services/notifications_service/notification.dart';

abstract class NotificationService{
  Future<void> init();
  Future<String> getNotificationDeviceId();
  void listenForeground();
  void handleBackground(MessageNotification notification);
}