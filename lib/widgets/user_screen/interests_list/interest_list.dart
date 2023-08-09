import 'package:close_frontend/widgets/user_screen/interests_list/intrest_row.dart';
import 'package:flutter/material.dart';

class InterestList extends StatelessWidget {
  final List<String> _interests;
  const InterestList(this._interests);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),  
      shrinkWrap: true,
      itemCount: _interests.length,
      itemBuilder: (_, int i){
        return Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: _getInterestRow(i)
        );
      }
    );
  }

  InterestRow _getInterestRow(int index){
    return isEven(index) 
      ? InterestRow.right(_interests[index])
      : InterestRow.left(_interests[index]);
  }

  bool isEven(int n){
    return n%2 == 0;
  }

}