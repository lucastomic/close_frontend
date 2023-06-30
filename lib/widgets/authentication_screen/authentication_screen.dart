import 'package:close_frontend/widgets/authentication_screen/authentication_forms/customized_input/factory/ports/login_input_factory_port.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_forms/customized_input/factory/ports/register_input_factory_port.dart';
import 'package:close_frontend/widgets/util_widgets/decored_button/decored_button.dart';
import 'package:flutter/material.dart';
import 'authentication_forms/login_from.dart';
import 'authentication_forms/register_form.dart';

class AuthenticationScreen extends StatelessWidget {
  final Widget _form; 
  final Widget _changeScreenButton;

  AuthenticationScreen.login(ILoginInputFactory inputFactory)
      : _form = LoginForm(inputFactory),
        _changeScreenButton = _ChangeScreenButton("Aun no tengo cuenta", "register");

  AuthenticationScreen.register(IRegisterInputFactory inputFactory)
      : _form = RegisterForm(inputFactory),
        _changeScreenButton = _ChangeScreenButton("Ya tengo cuenta", "login");

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
