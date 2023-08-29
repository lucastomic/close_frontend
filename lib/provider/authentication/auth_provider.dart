import 'package:close_frontend/domain/social_network/social_network.dart';
import 'package:close_frontend/domain/user/authenticated_user.dart';
import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/http/http_requester.dart';
import 'package:close_frontend/local_storage/local_storage_port.dart';
import 'package:close_frontend/services/authentication_service/port/authentication_service_port.dart';
import 'package:close_frontend/services/authentication_service/create_user_request_data.dart';
import 'package:close_frontend/widgets/social_networks_screen/social_network_form/social_network_form.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  AuthenticatedUser? _authenticatedUser;
  String? _authenticationToken;
  final IAuthenticationLocalStorage _localStorage;

  final IAuthenticationService _authenticationService;

  AuthenticationProvider(this._authenticationService, this._localStorage);

  Future<void> authenticateFromLocalStorage() async {
    _authenticationToken = await _localStorage.getAuthToken();
    if(_authenticationToken != null) await _authenticate(_authenticationToken!);
  }

  Future<void> logIn(String username, String password) async {
    _authenticationToken = await _authenticationService.tokenFromLogin(username, password);
    await _authenticate(_authenticationToken!);
  }

  void logOut(){
    _authenticationToken = null;
    _authenticatedUser = null;
    HTTPRequester.cleanAuthenticationToken();
    _localStorage.cleanAuthToken();
  }

  Future<void> register(CreateUserRequestData requestData) async {
    _authenticationToken = await _authenticationService.tokenFromRegister(requestData);
    await _authenticate(_authenticationToken!);
  }

  Future<void> refreshUser() async {
    _authenticatedUser = await _authenticationService.getUserFromToken(_authenticationToken!);
  }

  AuthenticatedUser get authenticatedUser {
    assert(_authenticationToken !=null, "There is no authentitcated user");
    return _authenticatedUser!;
  }

  String get authenticationToken {
    assert(_authenticationToken !=null, "There is no authentitcated user");
    return _authenticationToken!;
  }

  bool get isCurrentlyAuthenticated{
    return _authenticatedUser != null;
  }

  void addNewInterest(String interest){
    _authenticatedUser!.addNewInterest(interest);
  }



  bool isUserAuthenticated(User user){
    return _authenticatedUser!.id == user.id;
  }

  String? getUsernameFromSocialNetwork(SocialNetwork socialNetwork){
    return _authenticatedUser!.socialNetworks[socialNetwork];
  }

  int get ducksReceived{
    return _authenticatedUser!.ducksReceived;
  } 

  void updateSocialNetowrks(Map<SocialNetwork,String?> socialNetowrks){
    Map<SocialNetwork,String> existingElements = {};
    socialNetowrks.forEach((socialNetwork, username) {
      if(username != null) existingElements.addAll({socialNetwork:username});
    });
    _authenticatedUser!.socialNetworks = existingElements;
    notifyListeners();
  }

  Future<void> _authenticate(String token) async {
    await _localStorage.setAuthToken(token);
    HTTPRequester.authenticationToken = token;
    _authenticatedUser = await _authenticationService.getUserFromToken(_authenticationToken!);
  }
}
