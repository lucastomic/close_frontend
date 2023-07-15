import 'package:close_frontend/widgets/util_widgets/decored_button/decored_button.dart';
import 'package:flutter/material.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedButton.hollow(
      context: context,
      text: "Cerrar sesión",
      onPressed: _logOut,
    );
  }

  void _logOut(){
    //TODO: implement 
  }
}