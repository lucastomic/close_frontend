import 'package:close_frontend/dependency_injection/injection.dart';
import 'package:close_frontend/services/close_users/close_users_servic_port.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_forms/customized_input/factory/ports/login_input_factory_port.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_forms/customized_input/factory/ports/register_input_factory_port.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_screen.dart';
import 'package:close_frontend/widgets/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'main': (_) => MainScreen(getIt.get<ICloseUsersService>()),
  'login': (_) => AuthenticationScreen.login(getIt.get<ILoginInputFactory>()),
  'register': (_) => AuthenticationScreen.register(getIt.get<IRegisterInputFactory>()),
};

const String initalRoute = 'login';
const String title = "close";
ThemeData themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor:const Color.fromRGBO(0, 151, 182, 1),
    primary: const Color.fromRGBO(0, 151, 182, 1),
    error: const Color.fromARGB(255, 185, 12, 0),
  ),
  primaryColor: Colors.white,
  useMaterial3: true,
);
