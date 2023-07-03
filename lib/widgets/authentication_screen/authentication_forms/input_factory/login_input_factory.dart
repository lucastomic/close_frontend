import 'package:close_frontend/widgets/authentication_screen/authentication_forms/input_factory/ports/login_input_factory_port.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_forms/input_factory/validator/input_validator.dart';
import 'package:close_frontend/widgets/forms/inputs/text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../forms/inputs/form_input.dart';

@Injectable(as: ILoginInputFactory)
class LoginInputFactory implements ILoginInputFactory{
  final InputValidator _validator;
  const LoginInputFactory(this._validator);

  @override
  FormInput username(){
    return TextFormInput( 
      validate: _validator.mandatoryInputValidation,
      hintText: 'myusername', 
      labelText: 'Username', 
      icon: Icons.account_circle_outlined, 
      key: GlobalKey() ,
    );
  }
  @override
  FormInput passaword(){
    return TextFormInput( 
      validate: _validator.minimumLengthValidation, 
      hintText: '******',
      labelText: 'Contraseña',
      icon: Icons.lock_outline,
      obscureText: true,
      key: GlobalKey() ,
    );
  }
}


