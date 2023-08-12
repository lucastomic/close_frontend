import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/services/interests_service/interest_service_port.dart';
import 'package:close_frontend/widgets/forms/inputs/form_input_list/interests_form_input_list.dart';
import 'package:close_frontend/widgets/forms/user_modifing/user_modifing_form.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interest_checkers_factory/interest_checker_factory_port.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InterestForm extends StatefulWidget {
  final IInterestService _interestService;
  final IInterestCheckerFactory _checkerFactory;
  final String? _nextPage;

  const InterestForm(
    this._interestService, 
    this._checkerFactory,
    {
      String? nextPage //If it's omitted it will Pop to the previous page as default
    }
  ):_nextPage = nextPage;

  @override
  State<InterestForm> createState() => _InterestFormState();
}

class _InterestFormState extends State<InterestForm> {
  late final AuthenticationProvider _authProvider;

  @override
  void initState() {
    _authProvider = context.read<AuthenticationProvider>();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget._checkerFactory.getInterestCheckers(context),
      builder: (context, snapshot) {
        return UserModifingForm<String,bool>(
          submitButtonText: "Guardar",   
          inputs: InterestsFormInputsList( 
            snapshot.data ?? {},
            (String interest){
              setState(() {
                _authProvider.addNewInterest(interest);
              });
            }
          ), 
          onSubmit: _submit,
          nextPage: widget._nextPage,
        );
      }
    );
  }


  Future<void> _submit(Map<String, bool> inputs)async{
    await Future.forEach(inputs.entries,(entry) async{
      await _processFormInput(entry.key, entry.value);
    });    
  }

  Future<void> _processFormInput(String interest, bool selected)async{
    selected 
    ? await widget._interestService.addInterest(interest) 
    : await widget._interestService.removeInterest(interest);
  }
}
