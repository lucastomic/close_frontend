import 'package:close_frontend/widgets/forms/inputs/form_input.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interest_checker_box.dart';

abstract class InterestCheckerAdder{
  final Map<String,FormInput<bool>> interests;
  InterestCheckerAdder(this.interests);

  void addInterestsSelected(List<String> newInterests){
    _addInterests(newInterests, true);
  }

  void addInterestsUnselected(List<String> newInterests){
    _addInterests(newInterests, false);
  }

  void _addInterests(List<String> newInterests, bool selected){
    for (var interest in newInterests) {
      if(interests[interest] == null) _addInterest(interest, selected);
    }
  }
  void _addInterest(String interest, bool selected){
      interests.addAll({interest:InterestCheckerBox(interest, defaultValue: selected,)});
  }
}

