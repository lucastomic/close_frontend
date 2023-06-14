import 'package:close_frontend/widgets/screens/close_users_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'closeUsers': (_) => CloseUsersScreen(),
};

const String initalRoute = 'closeUsers';
