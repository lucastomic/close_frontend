
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interest_checkers_manager/adders/abstract/interest_checker_adder.dart';

class SimpleAdder extends InterestCheckerAdder{
  SimpleAdder(super.interests);

  void addSelectedInterest(String interest) async {
    super.addInterestsSelected([interest]);
  }
}