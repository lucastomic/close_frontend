import 'package:close_frontend/domain/social_network/social_network.dart';
import 'package:close_frontend/domain/user/authenticated_user.dart';
import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/exceptions/exception_with_message.dart';
import 'package:close_frontend/services/authentication_service/port/authentication_service_port.dart';
import 'package:close_frontend/services/authentication_service/create_user_request_data.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  AuthenticatedUser? _authenticatedUser;
  String? _authenticatedToken;
  final IAuthenticationService _authenticationService;

  AuthenticationProvider(this._authenticationService);

  Future<void> logIn(String username, String password) async {
    try{
      _authenticatedToken = await _authenticationService.tokenFromLogin(username, password);
      _authenticatedUser = await _authenticationService.getUserFromToken(_authenticatedToken!);
    }on ExceptionWithMessage{
      rethrow;
    }
  }

  Future<void> register(CreateUserRequestData requestData) async {
    try{
      _authenticatedToken = await _authenticationService.tokenFromRegister(requestData);
      _authenticatedUser = await _authenticationService.getUserFromToken(_authenticatedToken!);
    }on ExceptionWithMessage{
      rethrow;
    }
  }

  Future<void> refreshUser() async {
    _authenticatedUser = await _authenticationService.getUserFromToken(_authenticatedToken!);
  }

  User get authenticatedUser {
    assert(_authenticatedToken !=null, "There is no authentitcated user");
    return _authenticatedUser!;
  }

  String get authenticationToken {
    assert(_authenticatedToken !=null, "There is no authentitcated user");
    return _authenticatedToken!;
  }

  String? getUsernameFromSocialNetwork(SocialNetwork socialNetwork){
    return _authenticatedUser!.socialNetworks[socialNetwork];
  }

  int get ducksReceived{
    return _authenticatedUser!.ducksReceived;
  }
}
