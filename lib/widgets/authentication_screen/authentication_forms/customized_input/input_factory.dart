import 'package:close_frontend/widgets/authentication_screen/authentication_forms/customized_input/custom_form_input.dart';
import 'package:flutter/material.dart';

class InputFactory{
  
  CustomFormInput username(GlobalKey key){
    return CustomFormInput(
      validate: _mandatoryInputValidation,
      hintText: 'myusername', 
      labelText: 'Username', 
      icon: Icons.account_circle_outlined, 
      key: key
    );
  }
  CustomFormInput passaword(GlobalKey key){
    return CustomFormInput(
      validate: _mandatoryInputValidation, 
      hintText: '******',
      labelText: 'Contraseña',
      icon: Icons.lock_outline,
      obscureText: true,
      key: key ,
    );
  }

  String? _mandatoryInputValidation(String? value){
    if(value == null || value =="") return "Este campo es obligatorio";
    return null;
  }

}