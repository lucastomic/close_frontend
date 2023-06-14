import 'package:flutter/material.dart';

import '../../domain/user/user.dart';

class UserProvider extends ChangeNotifier {
  User? _authenticatedUser;
}
