import 'package:close_frontend/math/math.dart';
import 'package:close_frontend/services/interests_service/interest_service_port.dart';
import 'package:close_frontend/widgets/forms/inputs/form_input.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interest_checkers_manager/adders/abstract/limited_interests_adder.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interest_checkers_manager/adders/different_interests_adder.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interest_checkers_manager/adders/popular_interests_adder.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interest_checkers_manager/adders/simple_adder.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interest_checkers_manager/adders/user_selected_interests_adder.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interest_checkers_manager/interest_checker_manager_port.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:IInterestCheckerManager)
class InterestCheckerBoxManager implements IInterestCheckerManager{
  final IInterestService _interestService;
  final int _minimumAmountOfCheckers = 12;
  final Map<String,FormInput<bool>> _interestCheckers = {};

  late PopularInterestsAdder _popularInterestsAdder;
  late DifferentInterestsAdder _differentInterestsAdder;
  late UserSelectedInterestsAdder _userSelectedInterestsAdder;
  late SimpleAdder _simpleAdder;


  InterestCheckerBoxManager(this._interestService){
    _popularInterestsAdder = PopularInterestsAdder(_interestCheckers, _interestService) ;
    _differentInterestsAdder = DifferentInterestsAdder(_interestCheckers, _interestService);
    _simpleAdder = SimpleAdder(_interestCheckers);
    _userSelectedInterestsAdder = UserSelectedInterestsAdder(_interestCheckers);
  } 

  @override
  Future<Map<String,FormInput<bool>>> getInterestCheckers(BuildContext context)async{
    _userSelectedInterestsAdder.addInterests(context);
    await _addNeededInterestCheckers(_popularInterestsAdder);
    await _addNeededInterestCheckers(_differentInterestsAdder);
    return _interestCheckers;
  }

  @override
  Future<Map<String,FormInput<bool>>> getLastReturnedPlusSelected(String interest)async{
    _simpleAdder.addSelectedInterest(interest);
    _removeUnselectedIfNeeded();
    await _addNeededInterestCheckers(_differentInterestsAdder);
    return _interestCheckers;
  }

  Future<void> _addNeededInterestCheckers(LimitedInterestsAdder adder)async{
    if(_shouldAddMoreCheckers()){
      int numberOfCheckersToAdd = _numberOfCheckersToAdd();
      await adder.addInterests(numberOfCheckersToAdd);
    }
  }

  void _removeUnselectedIfNeeded(){
    if(_shouldRemoveOneChecker()) _removeUnselectedCheckerIfExists();
  }

  int _numberOfCheckersToAdd(){
    if (_interestCheckers.length < _minimumAmountOfCheckers) return _minimumAmountOfCheckers - _interestCheckers.length;  
    if (Math.isOdd(_interestCheckers.length)) return 1; //They must be even to be displayed correctly
    return 0;
  }

  bool _shouldAddMoreCheckers(){
    return _numberOfCheckersToAdd() != 0;
  }

  bool _shouldRemoveOneChecker(){
    return Math.isOdd(_interestCheckers.length) && _interestCheckers.length > _minimumAmountOfCheckers;
  }

  void _removeUnselectedCheckerIfExists(){
    for (var interest in _getInterestsReversed()) {
      if(!_interestCheckers[interest]!.value){
        _interestCheckers.remove(interest);
        break;
      }
    }
  }
  Iterable<String> _getInterestsReversed(){
    return _interestCheckers.keys.toList().reversed;
  }
}


