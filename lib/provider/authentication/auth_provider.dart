import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/exceptions/authentication/bad_credentials_exception.dart';
import 'package:close_frontend/services/authentication_service/authentication_service_port.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  User? _authenticatedUser;
  final IAuthenticationService _authenticationService;

  AuthenticationProvider(this._authenticationService);

  Future<void> logIn(String username, String password) async {
    try{
      _authenticatedUser = await _authenticationService.login(username, password);
    }on BadCredentialsException{
      rethrow;
    }
  }

  get authenticatedUser {
    return _authenticatedUser;
  }
}
