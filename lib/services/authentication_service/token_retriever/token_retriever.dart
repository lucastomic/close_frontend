import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_requester.dart';
import 'package:close_frontend/http/http_response_to_exception_conversor.dart';

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
    Exception? commonException = HTTPResponseToExceptionConversor.convert(response);
    if(commonException !=null) return commonException;
    return _getExceptionFromResponse(response);
  }

  Future<void> _makeRequest()async{
    _httpResponse = await HTTPRequester.post(_httpRequest);
  }

  String _getAuthenticationTokenFromRequest(){
    return _httpResponse.body["token"];
  }
}