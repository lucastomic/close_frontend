import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interest_checkers_manager/adders/abstract/interest_checker_adder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserSelectedInterestsAdder extends InterestCheckerAdder{
  UserSelectedInterestsAdder(super.interests);

  void addInterests(BuildContext context) async {
    AuthenticationProvider authProvider = context.read<AuthenticationProvider>();
    User authUser = authProvider.authenticatedUser;
    super.addInterestsSelected(authUser.interests);
  }
}