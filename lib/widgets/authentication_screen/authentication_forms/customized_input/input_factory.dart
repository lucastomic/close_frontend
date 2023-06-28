import 'package:close_frontend/widgets/authentication_screen/authentication_forms/customized_input/custom_form_input.dart';
import 'package:flutter/material.dart';

class InputFactory{
  const InputFactory();

  CustomFormInput username(){
    return CustomFormInput( 
      validate: _mandatoryInputValidation,
      hintText: 'myusername', 
      labelText: 'Username', 
      icon: Icons.account_circle_outlined, 
      key: GlobalKey() ,
    );
  }
  CustomFormInput passaword(){
    return CustomFormInput( 
      validate: _atLeast6charactersValidation, 
      hintText: '******',
      labelText: 'Contraseña',
      icon: Icons.lock_outline,
      obscureText: true,
      key: GlobalKey() ,
    );
  }

  CustomFormInput profileName(){
    return CustomFormInput( 
      validate: _mandatoryInputValidation, 
      hintText: 'My complete name',
      labelText: 'Nombre de perfil',
      icon: Icons.abc,
      key: GlobalKey() ,
    );
  }

  CustomFormInput phone(){
    return CustomFormInput( 
      validate: _mandatoryInputValidation, 
      hintText: '+34 123 321 123',
      labelText: 'Numero de teléfono',
      icon: Icons.phone,
      key: GlobalKey() ,
    );
  }

  String? _mandatoryInputValidation(String? value){
    if(value == null || value =="") return "Este campo es obligatorio";
    return null;
  }
  String? _atLeast6charactersValidation(String? value){
    if(value == null || value =="") return "Este campo es obligatorio";
    if(value.length < 6) return "La contraseña debe tener al menos 6 caracteres";
    return null;
  }
}
