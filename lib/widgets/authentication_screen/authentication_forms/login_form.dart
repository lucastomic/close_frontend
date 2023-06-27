import 'package:close_frontend/exceptions/authentication/bad_credentials_exception.dart';
import 'package:close_frontend/popup_alert_displayer/popup_alert_displayer.dart';
import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_forms/customized_input/input_factory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'customized_input/custom_form_input.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isLoading = false;
  final GlobalKey<CustomFormInputState> _usernameKey =  GlobalKey();
  final GlobalKey<CustomFormInputState> _passwordKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final inputFactory = InputFactory();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          inputFactory.username(_usernameKey),
          const SizedBox(height: 30),
          inputFactory.passaword(_passwordKey),
          const SizedBox(height: 30),
          MaterialButton(
            onPressed: _isLoading ? null : _onSubmit,
            child: Text(_isLoading ? 'Espere' : 'Ingresar'),
          ),
        ],
      ),
    );
  }

  void _onSubmit() {
    _unfocusTarget();
    _usernameKey.currentState!.validate();
    _passwordKey.currentState!.validate();
    if(_allInputsAreValid()) {
      _executeWhileLoads(_tryToAuthenticate);
    }
  }

  void _executeWhileLoads(Function() func)async{
    setState(() {
      _isLoading = true;
    });
    await func();
    setState(() {
      _isLoading = false;
    });
  }

  bool _allInputsAreValid(){
    return _usernameKey.currentState!.isValid() && _passwordKey.currentState!.isValid();
  }

  Future<void> _tryToAuthenticate()async {
    AuthenticationProvider authenticationProvider = context.read<AuthenticationProvider>();
    try{
      await authenticationProvider.logIn(_usernameKey.currentState!.value, _passwordKey.currentState!.value);
      Navigator.of(context).pushNamed("main");
    }on BadCredentialsException catch(e){
      PopUpAlertDisplayer.showAlert(context, "Error al logearse", e.message);
    }
  }

  void _unfocusTarget(){
    FocusScope.of(context).unfocus();   
  }
}
