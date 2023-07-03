import 'package:close_frontend/widgets/forms/inputs/ui_widgets/input_box_shadows.dart';
import 'package:flutter/material.dart';

class DecoratedInputContainer extends StatelessWidget {

  final Widget child;

  const DecoratedInputContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:30),
      child: Container(
        width: double.infinity,   
        decoration: _buildDecoration(context),
        child: child,
      ),
    );
  }

  BoxDecoration _buildDecoration(BuildContext context) => BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: Theme.of(context).primaryColor,
    boxShadow: InputBoxShadows.getInputBoxShadows(),
  );
}
