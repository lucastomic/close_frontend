import 'package:close_frontend/widgets/forms/inputs/form_input.dart';

abstract class ILoginInputFactory{
  FormInput<String> username();
  FormInput<String> passaword();
}