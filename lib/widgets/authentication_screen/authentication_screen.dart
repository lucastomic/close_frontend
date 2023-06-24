import 'package:flutter/material.dart';
import 'authentication_forms/login_form.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({required String title, required Widget form, required Widget changeScreenButton})
      : _title = title,
        _changeScreenButton = changeScreenButton,
        _form = form;
  final String _title;
  final Widget _form;
  final Widget _changeScreenButton;

  AuthenticationScreen.login()
      : _title = "Login",
        _form = LoginForm(),
        _changeScreenButton = Container();

  // AuthenticationScreen.register()
  //     : _title = "Register",
  //       _form = RegisterForm(),
  //       _changeScreenButton = Container();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  _Title(_title),
                  const SizedBox(height: 30),
                  _form,
                  _changeScreenButton,
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ));
  }
}

class _Title extends StatelessWidget {
  final String _title;
  _Title(String title) : this._title = title;

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.black),
    );
  }
}
