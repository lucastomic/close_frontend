import 'package:close_frontend/config/config.dart';
import 'package:close_frontend/dependency_injection/injection.dart';
import 'package:close_frontend/local_storage/local_storage_port.dart';
import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/services/authentication_service/port/authentication_service_port.dart';
import 'package:close_frontend/widgets/router_screen/current_page_provider.dart';
import 'package:close_frontend/widgets/splash_screen/splash_screen_functionality.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  configureDependencies();
  perserveSplashScreen();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthenticationProvider(getIt.get<IAuthenticationService>(),getIt.get<IAuthenticationLocalStorage>())),
      ChangeNotifierProvider(create: (_) => CurrentPageProvider()),
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
      routes: routes,
      initialRoute: initalRoute,
    );
  }
}
