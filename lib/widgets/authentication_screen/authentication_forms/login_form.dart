import 'package:close_frontend/exceptions/authentication/bad_credentials_exception.dart';
import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_forms/authentication_error_message_box.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_forms/customized_input/input_factory.dart';
import 'package:close_frontend/widgets/util_widgets/decored_button/decored_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'customized_input/custom_form_input.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isLoading = false;
  String? _errorMessage;
  final GlobalKey<CustomFormInputState> _usernameKey =  GlobalKey();
  final GlobalKey<CustomFormInputState> _passwordKey = GlobalKey();
  final inputFactory = InputFactory();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          _showErrorMessageIfExists(),
          inputFactory.username(_usernameKey),
          const SizedBox(height: 30),
          inputFactory.passaword(_passwordKey),
          const SizedBox(height: 30),
          DecoratedButton.primaryColor(
            context: context,
            text: "Ingresar", 
            onPressed: _onSubmit, 
            formIsLoading: _isLoading,
          ),
        ],
      ),
    );
  }

  void _onSubmit() {
    _cleanErrorMessage();
    _unfocusTarget();
    _usernameKey.currentState!.validate();
    _passwordKey.currentState!.validate();
    if(_allInputsAreValid()) {
      _executeWhileLoads(_tryToAuthenticate);
    }
  }

  Widget _showErrorMessageIfExists(){
    return _errorMessage != null ? AuthenticationErrorMessageBox(_errorMessage!) : Container();
  }

  bool _allInputsAreValid(){
    return _usernameKey.currentState!.isValid() && _passwordKey.currentState!.isValid();
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

  Future<void> _tryToAuthenticate()async {
    AuthenticationProvider authenticationProvider = context.read<AuthenticationProvider>();
    try{
      await authenticationProvider.logIn(_usernameKey.currentState!.value, _passwordKey.currentState!.value);
      Navigator.of(context).pushNamed("main");
    }on BadCredentialsException catch(e){
      _updateErrorMessage(e.message);
    }
  }

  void _unfocusTarget(){
    FocusScope.of(context).unfocus();   
  }

  void _cleanErrorMessage(){
      setState(() {
        _errorMessage = null;
      });
  }

  void _updateErrorMessage(String message){
      setState(() {
        _errorMessage = message;
      });
  }

}
