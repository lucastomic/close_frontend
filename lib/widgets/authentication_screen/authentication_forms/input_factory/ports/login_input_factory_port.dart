import 'package:close_frontend/widgets/forms/inputs/form_input.dart';

abstract class ILoginInputFactory{
  FormInput username();
  FormInput passaword();
}