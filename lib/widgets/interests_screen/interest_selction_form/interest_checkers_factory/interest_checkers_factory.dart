import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/services/interests_service/interest_service_port.dart';
import 'package:close_frontend/widgets/forms/inputs/form_input.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interest_checker_box.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interest_checkers_factory/interest_checker_factory_port.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

@Injectable(as:IInterestCheckerFactory)
class InterestCheckerBoxFactory implements IInterestCheckerFactory{
  final IInterestService _interestService;
  final int _minimumAmountOfCheckers = 12;
  late Map<String,FormInput<bool>> _interests;

  InterestCheckerBoxFactory(this._interestService);

  @override
  Future<Map<String,FormInput<bool>>> getInterestCheckers(BuildContext context)async{
    _interests = {};
    _addUserSelectedInterests(context);
    await _addPopularInterestsIfNeeded();
    await _addDifferentInterestsIfNeeded();
    return _interests;
  }

  void _addUserSelectedInterests(BuildContext context){
    AuthenticationProvider authProvider = context.read<AuthenticationProvider>();
    User authUser = authProvider.authenticatedUser;
    _addInterests(authUser.interests, true);
  }

  Future<void> _addPopularInterestsIfNeeded()async{
    if(_shouldAddMoreCheckers()){
      int numberOfCheckersToAdd = _numberOfCheckersToAdd();
      await _addPopularCheckers(numberOfCheckersToAdd);
    }
  }

  Future<void> _addDifferentInterestsIfNeeded()async{
    if(_shouldAddMoreCheckers()){
      int numberOfCheckersToAdd = _numberOfCheckersToAdd();
      await _addDifferentInterests(numberOfCheckersToAdd);
    }
  }

  Future<void> _addPopularCheckers(int checkersToAdd)async{
    List<String> newInterests = await _interestService.getPopularInterests(checkersToAdd);
    _addInterests(newInterests, false);
  }
  Future<void> _addDifferentInterests(int checkersToAdd)async{
    List<String> newInterests = await _interestService.getExcluding(_interests.keys.toList(),checkersToAdd);
    _addInterests(newInterests, false);
  }

  int _numberOfCheckersToAdd(){
    if (_interests.length < _minimumAmountOfCheckers) return _minimumAmountOfCheckers - _interests.length;  
    if (_isOdd(_interests.length)) return 1;
    return 0;
  }

  void _addInterests(List<String> newInterests, bool selected){
    for (var interest in newInterests) {
      if(_interests[interest] == null) _addInterest(interest, selected);
    }
  }

  bool _shouldAddMoreCheckers(){
    return _numberOfCheckersToAdd() != 0;
  }

  void _addInterest(String interest, bool selected){
      _interests.addAll({interest:InterestCheckerBox(interest, defaultValue: selected,)});
  }

  bool _isOdd(int n){
    return n%2 ==1;
  }
}