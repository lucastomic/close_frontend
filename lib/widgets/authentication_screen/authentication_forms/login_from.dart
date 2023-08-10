import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/widgets/forms/custom_form.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_forms/input_factory/ports/login_input_factory_port.dart';
import 'package:close_frontend/widgets/forms/inputs/form_inputs_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget{
  final ILoginInputFactory _inputFactory;
  LoginForm(this._inputFactory);

  @override
  Widget build(BuildContext context) {
    return CustomForm<String,String>(
      submitButtonText: "Ingresar",
      onSubmit: (Map<String,String> inputValues) async{  
        AuthenticationProvider authenticationProvider = context.read<AuthenticationProvider>();
        await authenticationProvider.logIn(
          inputValues["username"]!, 
          inputValues["password"]!
        );
        Navigator.of(context).pushNamed("main");
      }, 
      inputs: _getFormInputsList()
    );
  }


  FormInputsList<String,String> _getFormInputsList(){
    return FormInputsList<String,String>({
      "username": _inputFactory.username(),
      "password":_inputFactory.passaword(),
    });
  }
}
