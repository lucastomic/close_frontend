import 'package:flutter/material.dart';

class InterestSelectorBox extends StatefulWidget {
  bool _selected;
  String _interest;
  void Function() _onTap;
  InterestSelectorBox.selected(this._interest ,this._onTap):_selected = true;
  InterestSelectorBox.unselected(this._interest,this._onTap):_selected = false;

  @override
  State<InterestSelectorBox> createState() => _InterestSelectorBoxState();
}

class _InterestSelectorBoxState extends State<InterestSelectorBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget._onTap,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 200),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        decoration: BoxDecoration(
          border: Border.all(
            color: widget._selected ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
            width: widget._selected ? 1.5 : .5
          ),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Text(widget._interest, overflow: TextOverflow.ellipsis,textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
      ),
    );
  }
}