  import 'package:close_frontend/dependency_injection/injection.dart';
import 'package:close_frontend/services/interests_service/interest_service_port.dart';
import 'package:close_frontend/services/social_network/port/social_network_service_port.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_forms/input_factory/ports/login_input_factory_port.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_forms/input_factory/ports/register_input_factory_port.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_screen.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interest_checkers_manager/interest_checker_manager_port.dart';
import 'package:close_frontend/widgets/interests_screen/interests_screen.dart';
import 'package:close_frontend/widgets/router_screen/router_screen.dart';
import 'package:close_frontend/widgets/social_networks_screen/social_networks_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'main': (_) =>getIt.get<RouterScreen>(),
  'login': (_) => AuthenticationScreen.login(getIt.get<ILoginInputFactory>()),
  'register': (_) => AuthenticationScreen.register(getIt.get<IRegisterInputFactory>(),getIt.get<ISocialNetworkService>()),
  'modifySocialNetworks': (_) => SocialNetworksScreen(getIt.get<ISocialNetworkService>()),
  'newSocialNetworks': (_) => SocialNetworksScreen(getIt.get<ISocialNetworkService>(), nextPage: "newInterests",),
  'modifyInterests': (_) => InterestsScreen(getIt.get<IInterestService>(),getIt.get<IInterestCheckerManager>()),
  'newInterests': (_) => InterestsScreen(getIt.get<IInterestService>(),getIt.get<IInterestCheckerManager>(),nextPage: "main",),
};

const String initalRoute = 'login';
const String title = "close";
ThemeData themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(211, 0, 126, 161),
    primary: const Color.fromARGB(211, 0, 126, 161),
    onPrimary:const Color.fromARGB(210, 104, 178, 198), //onPrimary is the light version of primary
    error: const Color.fromARGB(255, 185, 12, 0),
  ),
  primaryColor: Colors.white,
  useMaterial3: true,
);

