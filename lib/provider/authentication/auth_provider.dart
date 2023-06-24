import 'package:close_frontend/domain/user/user.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  User? _authenticatedUser;
}
