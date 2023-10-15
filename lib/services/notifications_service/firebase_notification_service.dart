import 'dart:convert';
import 'package:close_frontend/dependency_injection/injection.dart';
import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/firebase_options.dart';
import 'package:close_frontend/provider/currentChatScreen/current_chat_screen_provider.dart';
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:close_frontend/services/navigation/navigation_service.dart';
import 'package:close_frontend/services/notifications_service/notification.dart';
import 'package:close_frontend/services/notifications_service/notification_service.dart';
import 'package:close_frontend/snackbar_displayer/snackbar_displayer.dart';
import 'package:close_frontend/widgets/chat_screen/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NotificationService)
class FirebaseNotificationService implements NotificationService{
  final IChatService _chatService;

  FirebaseNotificationService(this._chatService);

  @override
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await _askPermissions();
  }

  @override
  void listenForeground() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      User user = User.fromJson(jsonDecode(message.data["user"]));
      MessageNotification notification = MessageNotification(
        title: message.notification!.title!, 
        body: message.notification!.body!,
        user:user
      );
      if(!CurrentChatScreen.receiverIs(user)) SnackbarDisplayer.displayMessageNotification(notification,_chatService);
    });  
  }
  
// According to firebase-messaging documentation
// There are a few things to keep in mind about your background message handler:
// - It must not be an anonymous function.
// - It must be a top-level function (e.g. not a class method which requires initialization).
// So, the background listener can't be setted in this class (where should be its natural place). Instead of this,
// it's setted a handleBackground method, which handles what to do in front of a notification. But, this method doesn't
// listen that notifications, it's called in the method which listens them.
  @override
  void handleBackground(MessageNotification notification) {
    BuildContext context = NavigationService.navigatorKey.currentContext!;
    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ChatScreen(notification.user, getIt.get<IChatService>())));
  }


  @override
  Future<String> getNotificationDeviceId() async {
    String? token = await FirebaseMessaging.instance.getToken();
    return token!;
  }

  Future<void> _askPermissions() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission();
  }
  
}

