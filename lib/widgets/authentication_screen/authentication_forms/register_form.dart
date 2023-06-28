import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/services/authentication_service/create_user_request_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authentication_form.dart';
import 'customized_input/input_factory.dart';
import 'form_inputs_list.dart';

class RegisterForm extends StatelessWidget {
  final InputFactory _inputFactory = const InputFactory();

  @override
  Widget build(BuildContext context) {
    return AuthenticationForm(
        submitButtonText: "Registrarme",
        authenticate: (Map<String, String> inputValues) async {
          AuthenticationProvider authenticationProvider = context.read<AuthenticationProvider>();
          CreateUserRequestData requestData = CreateUserRequestData(
            username: inputValues["username"],
            profileName: inputValues["profileName"],
            password: inputValues["password"]
          );
          await authenticationProvider.register(requestData);
        },
        inputs: _getFormInputsList());
  }

  FormInputsList _getFormInputsList(){
    return FormInputsList({
      "username": _inputFactory.username(),
      "profileName": _inputFactory.profileName(),
      "password":_inputFactory.passaword(),
    });
  }
}
