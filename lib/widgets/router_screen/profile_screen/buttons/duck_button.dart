import 'package:close_frontend/widgets/duck/duck_logo.dart';
import 'package:flutter/material.dart';

class DuckButton extends StatelessWidget {
  const DuckButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DuckLogo.primary(width: 36);
  }
}