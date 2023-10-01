import 'package:close_frontend/notifications_handler/notifications_handler_port.dart';
import 'package:close_frontend/services/notifications_service/notification.dart';
import 'package:close_frontend/services/notifications_service/notification_service.dart';
import 'package:close_frontend/snackbar_displayer/snackbar_displayer.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: INotificationsHanlder)
class NotificationsHanlder implements INotificationsHanlder{
  final NotificationService _notificationService;
  NotificationsHanlder(this._notificationService);

  @override
  void init() async {
    await _notificationService.init();
    _notificationService.listenForeground(_onForegroundNotification);
    _notificationService.listenBackground(_onBackgroundNotification);
  }
  void _onForegroundNotification(Notification notification){
    SnackbarDisplayer.displayNotification(notification);
  }

  void _onBackgroundNotification(Notification notification){
    SnackbarDisplayer.displayNotification(notification);
  }
}