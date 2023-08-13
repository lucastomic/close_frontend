import 'package:close_frontend/services/interests_service/interest_service_port.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interest_checkers_manager/adders/abstract/interest_checker_adder.dart';

import 'abstract/limited_interests_adder.dart';

class DifferentInterestsAdder extends InterestCheckerAdder implements LimitedInterestsAdder{
  final IInterestService _interestService;

  DifferentInterestsAdder(super.interests, this._interestService);

  @override
  Future<void> addInterests(int limit) async {
    List<String> exclude = super.interests.keys.toList();
    List<String> newInterests = await _interestService.getExcluding(exclude,limit);
    super.addInterestsUnselected(newInterests);
  }
}
