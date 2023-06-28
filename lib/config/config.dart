import 'package:close_frontend/widgets/authentication_screen/authentication_screen.dart';
import 'package:close_frontend/widgets/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'main': (_) => const MainScreen(),
  'login': (_) => AuthenticationScreen.login(),
  'register': (_) => AuthenticationScreen.register(),
};

const String initalRoute = 'login';
const String title = "close";
ThemeData themeData = ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor:Color.fromRGBO(0, 151, 182, 1),
          primary: Color.fromRGBO(0, 151, 182, 1),
          error: const Color.fromARGB(255, 185, 12, 0),
        ),
        primaryColor: Colors.white,
        useMaterial3: true,
      );
