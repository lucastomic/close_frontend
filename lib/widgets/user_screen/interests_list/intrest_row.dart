import 'package:flutter/material.dart';

class InterestRow extends StatelessWidget {
  final String _interest;
  final _InterestRowPosition _position;

  InterestRow.left(this._interest): _position = _InterestRowPosition.left;
  InterestRow.right(this._interest): _position = _InterestRowPosition.right;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: _position.alignment,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: _position.borderRadius
        ),
        padding: _position.padding,
        child: Text(
          _interest, 
          style: TextStyle(
            color: Theme.of(context).primaryColor, 
            fontWeight: FontWeight.w500, 
            fontSize: 18
          ),
        ),
      ),
    );
  }

}


class _InterestRowPosition {
  static const double _borderRadiusNumber = 20;
  static const double _verticalPadding = 7;
  static const double _longPadding = 45;
  static const double _shortPadding = 20;
  final Alignment alignment;
  final BorderRadius borderRadius;
  final EdgeInsets padding;

  const _InterestRowPosition._internal(this.alignment, this.borderRadius, this.padding);

  static _InterestRowPosition left = const _InterestRowPosition._internal(
    Alignment.centerLeft,
    BorderRadius.horizontal(right: Radius.circular(_borderRadiusNumber)),
    EdgeInsets.only(right:_longPadding, left:_shortPadding, bottom: _verticalPadding,top:_verticalPadding),
  );
  
  static _InterestRowPosition right = const _InterestRowPosition._internal(
    Alignment.centerRight,
    BorderRadius.horizontal(left: Radius.circular(_borderRadiusNumber)),
    EdgeInsets.only(left:_longPadding, right:_shortPadding, bottom: _verticalPadding,top:_verticalPadding),
  );

}