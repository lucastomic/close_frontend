import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/exceptions/authentication/bad_credentials_exception.dart';
import 'package:close_frontend/services/authentication_service/port/authentication_service_port.dart';
import 'package:close_frontend/services/authentication_service/create_user_request_data.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  User? _authenticatedUser;
  String? _authenticatedToken;
  final IAuthenticationService _authenticationService;

  AuthenticationProvider(this._authenticationService);

  Future<void> logIn(String username, String password) async {
    try{
      _authenticatedToken = await _authenticationService.tokenFromLogin(username, password);
      _authenticatedUser = await _authenticationService.getUserFromToken(_authenticatedToken!);
    }on BadCredentialsException{
      rethrow;
    }
  }

  Future<void> register(CreateUserRequestData requestData) async {
    try{
      _authenticatedToken = await _authenticationService.tokenFromRegister(requestData);
      _authenticatedUser = await _authenticationService.getUserFromToken(_authenticatedToken!);
    }on BadCredentialsException{
      rethrow;
    }
  }

  User get authenticatedUser {
    assert(_authenticatedToken !=null, "There is no authentitcated user");
    return _authenticatedUser!;
  }

  String get authenticationToken {
    assert(_authenticatedToken !=null, "There is no authentitcated user");
    return _authenticatedToken!;
  }
}
