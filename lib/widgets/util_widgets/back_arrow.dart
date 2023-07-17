
import 'package:close_frontend/widgets/router_screen/current_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    CurrentPageProvider provider = context.read<CurrentPageProvider>();
    provider.goToDefaultPage();
  }
}