import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/services/interests_service/interest_service_port.dart';
import 'package:close_frontend/widgets/forms/inputs/form_input.dart';
import 'package:close_frontend/widgets/forms/inputs/form_input_list/grid_checker_form_input_list.dart';
import 'package:close_frontend/widgets/forms/user_modifing/user_modifing_form.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interest_checker_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class InterestForm extends StatefulWidget {
  final IInterestService _interestService;
  final String? _nextPage;

  const InterestForm(
    this._interestService, 
    {
      String? nextPage //If it's omitted it will Pop to the previous page as default
    }
  ):_nextPage = nextPage;

  @override
  State<InterestForm> createState() => _InterestFormState();
}

class _InterestFormState extends State<InterestForm> {
  final Map<String,FormInput<bool>> _inputs = {};
  late final AuthenticationProvider _authProvider;

  @override
  void initState() {
    _authProvider = context.read<AuthenticationProvider>();
    _addUserSelectedInterests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UserModifingForm<String,bool>(
      submitButtonText: "Guardar",   
      inputs: GridCheckerFormInputList(_inputs), 
      onSubmit: _submit,
      nextPage: widget._nextPage,
    );
  }


  void _addUserSelectedInterests(){
    User authUser= _authProvider.authenticatedUser;
    for (var interest in authUser.interests) {
      _inputs.addAll({interest:InterestCheckerBox.selected(interest)});
    }
  }

  Future<void> _submit(Map<String, bool> inputs)async{
    inputs.forEach(_processFormInput);
  }

  Future<void> _processFormInput(String interest, bool selected)async{
    selected 
    ? await widget._interestService.addInterest(interest) 
    : await widget._interestService.removeInterest(interest);
  }
}