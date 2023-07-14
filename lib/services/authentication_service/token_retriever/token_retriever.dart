import 'package:close_frontend/exceptions/internal_server_error.dart/internal_server_error.dart';
import 'package:close_frontend/exceptions/timeout/timeout_exception.dart';
import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_requester.dart';

import '../../../http/http_response.dart';

class TokenRetriever{
  late final HTTPResponse _httpResponse;
  final HTTPRequest _httpRequest;
  final Exception Function(HTTPResponse) _getExceptionFromResponse;

  TokenRetriever(this._httpRequest, this._getExceptionFromResponse);

  Future<String> getToken() async {
    await _makeRequest();
    if(_httpResponse.statusIsOK){
      return _getAuthenticationTokenFromRequest();  
    }else{
      throw _getException(_httpResponse);
    }
  } 

  Exception _getException(HTTPResponse response){
    if(response.statusIsTimeout)throw RenderizableTimeOutException();
    if(response.statusIsInternalServerError) throw InternalServerErrorException();
    return _getExceptionFromResponse(response);
  }

  Future<void> _makeRequest()async{
    _httpResponse = await HTTPRequester.post(_httpRequest);
  }

  String _getAuthenticationTokenFromRequest(){
    return _httpResponse.body["token"];
  }
}