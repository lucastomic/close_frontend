import 'package:close_frontend/config/config.dart';
import 'package:close_frontend/dependency_injection/injection.dart';
import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/local_storage/local_storage_port.dart';
import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/provider/location/location_provider.dart';
import 'package:close_frontend/services/authentication_service/port/authentication_service_port.dart';
import 'package:close_frontend/services/duck_service/duck_service_port.dart';
import 'package:close_frontend/services/location/location_service_port.dart';
import 'package:close_frontend/services/notifications_service/notification.dart';
import 'package:close_frontend/services/notifications_service/notification_service.dart';
import 'package:close_frontend/widgets/splash_screen/splash_screen_functionality.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/navigation/navigation_service.dart';

// According to firebase-messaging documentation
// There are a few things to keep in mind about your background message handler:
// - It must not be an anonymous function.
// - It must be a top-level function (e.g. not a class method which requires initialization).
// So, (unfortunately) the only way to listen the background notifications, is listening them here. 
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    User user = User.fromJson(message.data["user"]);
    getIt.get<NotificationService>().handleBackground(MessageNotification(
      title: message.notification!.title!, 
      body: message.notification!.body!, 
      user: user
    ));
}

void main() {
  configureDependencies();
  perserveSplashScreen();
  getIt.get<NotificationService>().init();
  getIt.get<NotificationService>().listenForeground();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthenticationProvider(getIt.get<IAuthenticationService>(),getIt.get<IAuthenticationLocalStorage>(),getIt.get<IDuckService>())),
      ChangeNotifierProvider(create: (_) => LocationProvider(getIt.get<ILocationService>())),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: themeData,
      navigatorKey: NavigationService.navigatorKey, 
      routes: routes,
      initialRoute: initalRoute,
    );
  }
}
