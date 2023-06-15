import 'package:close_frontend/widgets/screens/main_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'mainScreen': (_) => const MainScreen(),
};

const String initalRoute = 'mainScreen';
const String title = "close";
