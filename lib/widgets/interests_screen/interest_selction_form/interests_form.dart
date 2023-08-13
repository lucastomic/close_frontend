import 'package:close_frontend/services/interests_service/interest_service_port.dart';
import 'package:close_frontend/widgets/forms/inputs/form_input.dart';
import 'package:close_frontend/widgets/forms/inputs/form_input_list/interests_form_input_list.dart';
import 'package:close_frontend/widgets/forms/user_modifing/user_modifing_form.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interest_checkers_manager/interest_checker_manager_port.dart';
import 'package:flutter/material.dart';

class InterestsForm extends StatefulWidget {
  Map<String, FormInput<bool>> _inputs;
  final String? _nextPage;
  final IInterestService _interestService;
  final IInterestCheckerManager _checkerFactory;

  InterestsForm(this._inputs,this._interestService, this._nextPage,this._checkerFactory);

  @override
  State<InterestsForm> createState() => _InterestsFormState();
}

class _InterestsFormState extends State<InterestsForm> {
  @override
  Widget build(BuildContext context) {
    return UserModifingForm<String,bool>(
      submitButtonText: "Guardar",   
      inputs: InterestsFormInputsList( 
        widget._inputs,
        _addInterest
      ), 
      onSubmit: _submit,
      nextPage: widget._nextPage,
    );
  }

  Future<void> _addInterest(String interest)async{
    widget._inputs =await widget._checkerFactory.getLastReturnedPlusSelected(interest);
    setState(() {
    });
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
