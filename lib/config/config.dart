import 'package:close_frontend/widgets/authentication_screen/authentication_screen.dart';
import 'package:close_frontend/widgets/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'main': (_) => const MainScreen(),
  'login': (_) => AuthenticationScreen.login(),
  'register': (_) => AuthenticationScreen.login(),
};

const String initalRoute = 'login';
const String title = "close";
ThemeData themeData = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: Colors.white,
        useMaterial3: true,
      );