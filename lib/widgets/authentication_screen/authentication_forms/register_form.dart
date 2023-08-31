// ignore_for_file: use_build_context_synchronously
import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/services/authentication_service/create_user_request_data.dart';
import 'package:close_frontend/widgets/forms/custom_form.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_forms/input_factory/ports/register_input_factory_port.dart';
import 'package:close_frontend/widgets/forms/inputs/form_input_list/form_inputs_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  final IRegisterInputFactory _inputFactory;
  const RegisterForm(this._inputFactory,);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return CustomForm<String,String>(
        submitButtonText: "Registrarme",
        onSubmit: _onSubmit,
        inputs: _getFormInputsList());
  }

  Future<void> _onSubmit(Map<String, String> inputValues) async{
    AuthenticationProvider authenticationProvider = context.read<AuthenticationProvider>();
    CreateUserRequestData requestData = _createRequest(inputValues);
    await authenticationProvider.register(requestData);
    _moveToSocialNetworksScreen();
  }

  FormInputsList<String,String> _getFormInputsList(){
    return FormInputsList({
	    "photo": widget._inputFactory.photo(),
      "username": widget._inputFactory.username(),
      "profileName": widget._inputFactory.profileName(),
      "password":widget._inputFactory.passaword(),
    });
  }

  CreateUserRequestData _createRequest(Map<String, String> inputValues){
    return CreateUserRequestData(
      username: inputValues["username"],
      photo: inputValues["photo"],
      profileName: inputValues["profileName"],
      password: inputValues["password"]
    );
  }

  void _moveToSocialNetworksScreen(){
    Navigator.of(context).pushNamed("newSocialNetworks");
  }
}
