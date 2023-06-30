import 'package:close_frontend/config/config.dart';
import 'package:close_frontend/dependency_injection/injection.dart';
import 'package:close_frontend/image_manage/image_uplodaer/image_uploader.dart';
import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/services/authentication_service/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  configureDependencies();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthenticationProvider(AuthenticationService(new ImageUploader()))),
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
