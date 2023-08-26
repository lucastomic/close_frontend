import 'package:flutter/material.dart';

class BackArrowButton extends StatefulWidget {
  const BackArrowButton({super.key});

  @override
  State<BackArrowButton> createState() => _BackArrowButtonState();
}

class _BackArrowButtonState extends State<BackArrowButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _navigateBack,
      child: const Icon(Icons.arrow_back)
    );
  }

  void _navigateBack(){
    Navigator.of(context).pop();
  }
}