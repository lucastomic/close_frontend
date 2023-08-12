import 'package:close_frontend/widgets/forms/inputs/form_input.dart';
import 'package:flutter/material.dart';

class InterestCheckerBox extends FormInput<bool>{
  bool _selected;
  final String _interest;

  InterestCheckerBox.selected(this._interest):_selected = true;
  InterestCheckerBox.unselected(this._interest):_selected = false;
  InterestCheckerBox(this._interest,{bool defaultValue = false}):_selected = defaultValue;

  @override
  State<InterestCheckerBox> createState() => _InterestCheckerBoxState();
  
  @override
  bool get value => _selected;
}

class _InterestCheckerBoxState extends State<InterestCheckerBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){  
        setState(() {
          widget._selected = !widget._selected;
        });
      },
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