import 'package:close_frontend/widgets/user_screen/interests_list/intrest_item.dart';
import 'package:flutter/material.dart';

class InterestList extends StatelessWidget {
  final List<String> _interests;
  const InterestList(this._interests);

  @override
  Widget build(BuildContext context) {
    return Wrap(  
      
      children: _getInterestItems(),
    );
  }
  List<Widget>_getInterestItems(){
    List<Widget> response = [];
    for (var interest in _interests) {
      response.add(InterestItem(interest));
    }
    return response;
  }

}