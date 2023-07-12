import 'dart:convert';
import 'package:close_frontend/exceptions/authentication/bad_credentials_exception.dart';
import 'package:close_frontend/exceptions/http/server_connection_exception.dart';
import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_response.dart';
import 'package:close_frontend/services/authentication_service/token_retriever/token_retriever.dart';

import '../../../exceptions/timeout/timeout_exception.dart';

class LoginTokenRetriever{
  late final TokenRetriever _tokenRetriever;

  Future<String> getToken(String username, String password) async {
    _tokenRetriever = TokenRetriever(
      _getRequest(username, password), 
      _getExceptionFromResponse
    );
    try{
      return await _tokenRetriever.getToken();
    }catch(e){
      rethrow;
    }
  } 

  HTTPRequest _getRequest(String username, String password){
    return HTTPRequest.toServer(
      unencodedPath: "/auth/authenticate", 
      body: jsonEncode({"username": username, "password": password}), 
      headers: {"Content-Type":"application/json"}
    );
  }

  Exception _getExceptionFromResponse(HTTPResponse response){
    if(response.statusIsNotFound)throw BadCredentialsException("No existe ningun usuario con el username proporcionado");
    if(response.statusIsTimeout)throw RenderizableTimeOutException();
    if(response.statusIsBadRequest)throw BadCredentialsException("Contaseña incorrecta");
    throw ServerConnectionException();
  }
}