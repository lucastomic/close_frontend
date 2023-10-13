import 'dart:convert';
import 'package:close_frontend/exceptions/authentication/bad_credentials_exception.dart';
import 'package:close_frontend/exceptions/http/server_connection_exception.dart';
import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_response.dart';
import 'package:close_frontend/services/authentication_service/login_user_request_data.dart';
import 'package:close_frontend/services/authentication_service/token_retriever/token_retriever.dart';


class LoginTokenRetriever{
  late final TokenRetriever _tokenRetriever;

  Future<String> getToken(LoginUserRequestData requestData) async {
    _tokenRetriever = TokenRetriever(
      _getRequest(requestData), 
      _getExceptionFromResponse
    );
    try{
      return await _tokenRetriever.getToken();
    }catch(e){
      rethrow;
    }
  } 

  HTTPRequest _getRequest(LoginUserRequestData requestData){
    return HTTPRequest.toServer(
      unencodedPath: "/auth/authenticate", 
      body: jsonEncode({
        "username": requestData.username, 
        "password": requestData.password, 
        "deviceID":requestData.deviceID
      }), 
      headers: {"Content-Type":"application/json"}
    );
  }

  Exception _getExceptionFromResponse(HTTPResponse response){
    if(response.statusIsNotFound)throw BadCredentialsException("No existe ningun usuario con el username proporcionado");
    if(response.statusIsBadRequest)throw BadCredentialsException("Contaseña incorrecta");
    throw ServerConnectionException();
  }
}