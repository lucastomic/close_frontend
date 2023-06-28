import 'package:flutter/material.dart';

class AuthenticationErrorMessageBox extends StatelessWidget {
  final String _message;
  AuthenticationErrorMessageBox(this._message);
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.error,
          borderRadius: BorderRadius.circular(15)  
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(_message, style: TextStyle(color: Theme.of(context).primaryColor),),
      ),
    );
  }
}
