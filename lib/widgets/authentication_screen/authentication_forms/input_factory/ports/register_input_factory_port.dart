import 'package:close_frontend/widgets/authentication_screen/authentication_forms/input_factory/ports/login_input_factory_port.dart';
import 'package:close_frontend/widgets/forms/inputs/form_input.dart';

abstract class IRegisterInputFactory extends ILoginInputFactory{
  FormInput<String> profileName();
  FormInput<String> phone();
  FormInput<String> photo();
}