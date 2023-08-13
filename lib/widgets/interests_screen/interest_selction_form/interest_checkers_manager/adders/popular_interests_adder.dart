import 'package:close_frontend/services/interests_service/interest_service_port.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interest_checkers_manager/adders/abstract/interest_checker_adder.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interest_checkers_manager/adders/abstract/limited_interests_adder.dart';

class PopularInterestsAdder extends InterestCheckerAdder implements LimitedInterestsAdder{
  final IInterestService _interestService;

  PopularInterestsAdder(super.interests, this._interestService);

  @override
  Future<void> addInterests(int limit) async {
    List<String> newInterests = await _interestService.getPopularInterests(limit);
    super.addInterestsUnselected(newInterests);
  }
}