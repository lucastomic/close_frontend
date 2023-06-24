import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/authentication_service/authentication_service_port.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  User? _authenticatedUser;
  String? _authenticationToken;
  final IAuthenticationService _authenticationService;

  AuthenticationProvider(this._authenticationService);

  Future<void> logIn(String username, String password) async {
    _authenticationToken = await _authenticationService.login(username, password);
    _authenticatedUser = await _authenticationService.getUserFromToken(_authenticationToken!);
  }

  get authenticatedUser {
    return _authenticatedUser;
  }
}
