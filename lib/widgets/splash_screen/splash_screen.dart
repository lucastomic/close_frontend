import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final AuthenticationProvider provider;

  @override
  void initState() {
    provider = context.read<AuthenticationProvider>();
    _initializeApplication();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Theme.of(context).colorScheme.background,);
  }

  Future<void> _initializeApplication()async{
    await provider.authenticateFromLocalStorage();
    _redirectDependingOnAuthentication();
    await _removeSplashScreenAfterDelay();
  }

  void _redirectDependingOnAuthentication(){
      provider.isCurrentlyAuthenticated 
    ? Navigator.of(context).pushNamed("main")
    : Navigator.of(context).pushNamed("login"); 
  }

  Future<void> _removeSplashScreenAfterDelay()async{
    await Future.delayed(Duration(milliseconds: 500));
    FlutterNativeSplash.remove();
  }

}