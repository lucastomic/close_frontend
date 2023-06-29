import 'package:close_frontend/image_manage/image_picker/image_picker.dart';
import 'package:close_frontend/image_manage/image_picker/image_picker_port.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_forms/customized_input/form_input.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_forms/customized_input/photo_selector_input/photo_selector_input.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_forms/customized_input/text_form_input.dart';
import 'package:flutter/material.dart';

class InputFactory{
  const InputFactory();

  TextFormInput username(){
    return TextFormInput( 
      validate: _mandatoryInputValidation,
      hintText: 'myusername', 
      labelText: 'Username', 
      icon: Icons.account_circle_outlined, 
      key: GlobalKey() ,
    );
  }
  TextFormInput passaword(){
    return TextFormInput( 
      validate: _atLeast6charactersValidation, 
      hintText: '******',
      labelText: 'Contraseña',
      icon: Icons.lock_outline,
      obscureText: true,
      key: GlobalKey() ,
    );
  }

  TextFormInput profileName(){
    return TextFormInput( 
      validate: _mandatoryInputValidation, 
      hintText: 'My complete name',
      labelText: 'Nombre de perfil',
      icon: Icons.abc,
      key: GlobalKey() ,
    );
  }

  TextFormInput phone(){
    return TextFormInput( 
      validate: _mandatoryInputValidation, 
      hintText: '+34 123 321 123',
      labelText: 'Numero de teléfono',
      icon: Icons.phone,
      key: GlobalKey() ,
    );
  }

  FormInput photo(){
	ImagePickerPort imagePicker = ImagePickerImpl();
	return PhotoInputSelctor(imagePicker);
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
