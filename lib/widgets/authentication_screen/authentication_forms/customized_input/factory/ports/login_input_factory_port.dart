import 'package:close_frontend/widgets/authentication_screen/authentication_forms/customized_input/form_input.dart';

abstract class ILoginInputFactory{
  FormInput username();
  FormInput passaword();
}