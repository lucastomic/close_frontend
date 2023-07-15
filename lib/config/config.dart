  import 'package:close_frontend/dependency_injection/injection.dart';
import 'package:close_frontend/services/social_network/port/social_network_service_port.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_forms/input_factory/ports/login_input_factory_port.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_forms/input_factory/ports/register_input_factory_port.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_screen.dart';
import 'package:close_frontend/widgets/main_screen/main_screen.dart';
import 'package:close_frontend/widgets/social_networks_screen/social_networks_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'main': (_) =>getIt.get<MainScreen>(),
  'login': (_) => AuthenticationScreen.login(getIt.get<ILoginInputFactory>()),
  'register': (_) => AuthenticationScreen.register(getIt.get<IRegisterInputFactory>()),
  'socialNetworks': (_) => SocialNetworksScreen(getIt.get<ISocialNetworkService>()),
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
