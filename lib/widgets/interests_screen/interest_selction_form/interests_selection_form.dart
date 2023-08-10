import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/services/interests_service/interest_service_port.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interests_selector.dart';
import 'package:close_frontend/widgets/util_widgets/decored_button/decored_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'interest_selector_box.dart';

class InterestSelectionForm extends StatefulWidget {
  final IInterestService _interestService;
  InterestSelectionForm(this._interestService);

  @override
  State<InterestSelectionForm> createState() => _InterestSelectionFormState();
}

class _InterestSelectionFormState extends State<InterestSelectionForm> {
  final Map<String,bool> _interestsSelection = {};

  @override
  void initState() {
    _addUserSelectedInterests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(  
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InterestSelector(_interestsSelection),
        DecoratedButton.primaryColor(
          context: context, 
          text: "Guardar",
          onPressed: _submit,
        )
      ],
    );
  }

  void _addUserSelectedInterests(){
    AuthenticationProvider authProvider = context.read<AuthenticationProvider>();
    User authUser= authProvider.authenticatedUser;
    for (var interest in authUser.interests) {
      _interestsSelection.addAll({interest:true});
    }
  }

  Future<void> _submit()async{
    _interestsSelection.forEach(_processInterest);
  }

  Future<void> _processInterest(String interest, bool selected)async{
      selected 
      ? await widget._interestService.addInterest(interest) 
      : await widget._interestService.removeInterest(interest);
  }
}


