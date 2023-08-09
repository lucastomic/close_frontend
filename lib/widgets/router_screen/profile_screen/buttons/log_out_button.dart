
import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/widgets/util_widgets/decored_button/decored_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogOutButton extends StatefulWidget {
  const LogOutButton({super.key});

  @override
  State<LogOutButton> createState() => _LogOutButtonState();
}

class _LogOutButtonState extends State<LogOutButton> {
  @override
  Widget build(BuildContext context) {
    return DecoratedButton.hollow(
      context: context,
      text: "Cerrar sesión",
      onPressed: _logOut,
    );
  }

  void _logOut(){
    AuthenticationProvider authProvider = context.read<AuthenticationProvider>();
    authProvider.logOut();
    Navigator.of(context).pushNamed("login");
  }
}