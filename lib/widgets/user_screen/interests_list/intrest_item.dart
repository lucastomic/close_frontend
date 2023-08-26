import 'package:flutter/material.dart';

class InterestItem extends StatelessWidget {
  final String _interest;

  const InterestItem(this._interest);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(20)
      ),
      padding: const EdgeInsets.symmetric(horizontal:20, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal:14,vertical: 10),
      child: Text(
        _interest, 
        style: TextStyle(
          color: Theme.of(context).primaryColor, 
          fontWeight: FontWeight.w500, 
          fontSize: 14
        ),
      ),
    );
  }

}
