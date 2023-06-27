import 'package:close_frontend/widgets/util_widgets/decored_button/decored_button.dart';
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
        _changeScreenButton = _ChangeScreenButton("Aun no tengo cuenta", "register");

  // AuthenticationScreen.register()
  //     : _title = "Register",
  //       _form = RegisterForm(),
  //       _changeScreenButton = Container();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child:Column(
                children:[
                  _Header(),
                  _form,
                  _changeScreenButton,
                ],
              )
            ),
          ),
       )
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/logo.png");
  }
}

class _ChangeScreenButton extends StatelessWidget {
  final String _text;
  final String _route;

  _ChangeScreenButton(this._text,this._route);
  @override
  Widget build(BuildContext context) {
    return DecoratedButton.hollow(
      context: context, 
      text: _text, 
      onPressed: (){
        Navigator.of(context).pushNamed(_route);
      }
    );
  }
}