import 'package:close_frontend/config/enviroment.dart';
import 'package:close_frontend/dependency_injection/injection.dart';
import 'package:close_frontend/local_storage/local_storage_port.dart';
import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/provider/location/location_provider.dart';
import 'package:close_frontend/services/authentication_service/port/authentication_service_port.dart';
import 'package:close_frontend/services/duck_service/duck_service_port.dart';
import 'package:close_frontend/services/location/location_service_port.dart';
import 'package:close_frontend/services/notifications_service/notifications_init.dart';
import 'package:close_frontend/widgets/splash_screen/splash_screen_functionality.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/config.dart';
import 'services/navigation/navigation_service.dart';

void main() async {
  configureDependencies();
  await loadEnviroments();
  perserveSplashScreen();
  initNotifications();

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

