import 'package:close_frontend/widgets/authentication_screen/authentication_forms/customized_input/factory/ports/login_input_factory_port.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_forms/customized_input/form_input.dart';

abstract class IRegisterInputFactory extends ILoginInputFactory{
  FormInput profileName();
  FormInput phone();
  FormInput photo();
}