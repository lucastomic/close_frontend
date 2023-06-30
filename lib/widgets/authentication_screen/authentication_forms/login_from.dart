import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_forms/form_inputs_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authentication_form.dart';
import 'customized_input/factory/ports/login_input_factory_port.dart';

class LoginForm extends StatelessWidget{
  final ILoginInputFactory _inputFactory;
  LoginForm(this._inputFactory);

  @override
  Widget build(BuildContext context) {
	return AuthenticationForm(
	  submitButtonText: "Ingresar",
	  authenticate: (Map<String,String> inputValues) async{  
      AuthenticationProvider authenticationProvider = context.read<AuthenticationProvider>();
      await authenticationProvider.logIn(
        inputValues["username"]!, 
        inputValues["password"]!
      );
	  }, 
	  inputs: 	_getFormInputsList()
	);
  }

  FormInputsList _getFormInputsList(){
	return FormInputsList({
	  "username": _inputFactory.username(),
	  "password":_inputFactory.passaword(),
	});
  }
}
