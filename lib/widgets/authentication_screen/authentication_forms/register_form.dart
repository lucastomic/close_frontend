import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/services/authentication_service/create_user_request_data.dart';
import 'package:close_frontend/widgets/forms/custom_form.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_forms/input_factory/ports/register_input_factory_port.dart';
import 'package:close_frontend/widgets/forms/inputs/form_inputs_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatelessWidget {
  final IRegisterInputFactory _inputFactory;
  const RegisterForm(this._inputFactory);

  @override
  Widget build(BuildContext context) {
    return CustomForm(
        submitButtonText: "Registrarme",
        onSubmit: (Map<String, String> inputValues) async {
          AuthenticationProvider authenticationProvider = context.read<AuthenticationProvider>();
          CreateUserRequestData requestData = CreateUserRequestData(
            username: inputValues["username"],
            photo: inputValues["photo"],
            profileName: inputValues["profileName"],
            password: inputValues["password"]
          );
          await authenticationProvider.register(requestData);
          Navigator.of(context).pushNamed("socialNetworks");
        },
        inputs: _getFormInputsList());
  }

  FormInputsList _getFormInputsList(){
    return FormInputsList({
	    "photo": _inputFactory.photo(),
      "username": _inputFactory.username(),
      "profileName": _inputFactory.profileName(),
      "password":_inputFactory.passaword(),
    });
  }
}
