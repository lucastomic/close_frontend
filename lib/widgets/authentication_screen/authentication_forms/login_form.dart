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
          _getEmailInput(),
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


  void _onSubmit() async {
    AuthenticationProvider authenticationProvider = context.read<AuthenticationProvider>();
    FocusScope.of(context).unfocus();
    _executeWhileLoads((){
      _formKey.currentState!.validate();
      authenticationProvider.logIn(_emailKey.currentState!.value, _passwordKey.currentState!.value);
    });
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

  Widget _getEmailInput(){
    return CustomFormInput(
      validate: (String)=>null,
      hintText: 'john.doe@gmail.com', 
      labelText: 'Email', 
      icon: Icons.alternate_email_rounded, 
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
