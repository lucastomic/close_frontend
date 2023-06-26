import 'package:close_frontend/exceptions/authentication/bad_credentials_exception.dart';
import 'package:close_frontend/popup_alert_displayer/popup_alert_displayer.dart';
import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'customized_input/custom_form_input.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isLoading = false;
  final GlobalKey<CustomFormInputState> _emailKey =  GlobalKey();
  final GlobalKey<CustomFormInputState> _passwordKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _getUsernameInput(),
          const SizedBox(height: 30),
          _getPasswordInput(),  
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
    FocusScope.of(context).unfocus();
    _executeWhileLoads(()async{
      _formKey.currentState!.validate();
      await _tryToAuthenticate();
    });
  }

  Future<void> _tryToAuthenticate()async {
    AuthenticationProvider authenticationProvider = context.read<AuthenticationProvider>();
    try{
      await authenticationProvider.logIn(_emailKey.currentState!.value, _passwordKey.currentState!.value);
      Navigator.of(context).pushNamed("main");
    }on BadCredentialsException catch(e){
      PopUpAlertDisplayer.showAlert(context, "Error al logearse", e.message);
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

  Widget _getUsernameInput(){
    return CustomFormInput(
      validate: (String)=>null,
      hintText: 'myusername', 
      labelText: 'Username', 
      icon: Icons.account_circle_outlined, 
      key: _emailKey
    );
  }

  Widget _getPasswordInput(){
    return CustomFormInput(
      validate: (String)=>null, 
      hintText: '******',
      labelText: 'Contraseña',
      icon: Icons.lock_outline,
      obscureText: true,
      key: _passwordKey,
    );
  }
}
