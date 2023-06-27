import 'dart:convert';

import 'package:close_frontend/exceptions/authentication/bad_credentials_exception.dart';
import 'package:close_frontend/exceptions/http/server_connection_exception.dart';
import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_requester.dart';
import 'package:close_frontend/http/http_response.dart';

class LoginTokenRetriever{

  final String _username;
  final String _password;
  late final HTTPRequest _httpRequest;
  late final HTTPResponse _httpResponse;


  static Future<String> getTokenFromLogin(String username, String password){
    LoginTokenRetriever loginService = LoginTokenRetriever._internal(username: username,password: password);
    try{
      return loginService._getTokenFromLogin();
    }catch(e){
      rethrow;
    }
  }

  LoginTokenRetriever._internal({required String username, required String password})
  :_username = username, _password = password;

  Future<String> _getTokenFromLogin() async {
    _setRequest();
    await _makeRequest();
    if(_httpResponse.statusIsOK){
      return _getAuthenticationTokenFromRequest();  
    }else{
      throw _getExceptionFromResponse();
    }
  }

  void _setRequest(){
    _httpRequest = HTTPRequest.toServer(
      unencodedPath: "/auth/authenticate", 
      body: jsonEncode({"username": _username, "password": _password}), 
      headers: {"Content-Type":"application/json"}
    );
  }

  Future<void> _makeRequest()async{
    _httpResponse = await HTTPRequester.post(_httpRequest);
  }

  String _getAuthenticationTokenFromRequest(){
    return _httpResponse.body["token"];
  }

  Exception _getExceptionFromResponse(){
    assert(!_httpResponse.statusIsOK);
    if(_httpResponse.statusIsNotFound)throw BadCredentialsException("No existe ningun usuario con el username proporcionado");
    if(_httpResponse.statusIsBadRequest)throw BadCredentialsException("Contaseña incorrecta");
    throw ServerConnectionException();
  }
}