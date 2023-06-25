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
    boxShadow: const [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 15,
        offset: Offset(0,5)
      )
    ]
  );
}
