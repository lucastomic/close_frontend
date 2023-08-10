import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_requester.dart';

import '../../../http/http_response.dart';

class TokenRetriever{
  late final HTTPResponse _httpResponse;
  final HTTPRequest _httpRequest;
  final Exception Function(HTTPResponse) _getExceptionFromResponse;

  TokenRetriever(this._httpRequest, this._getExceptionFromResponse);

  Future<String> getToken() async {
    try{
      return await _makeRequestAndProcessResponse();
    }catch(e){
      rethrow;
    }
  } 

  Future<String> _makeRequestAndProcessResponse()async {
    await _makeRequest();
    if(_httpResponse.statusIsOK){
      return _getAuthenticationTokenFromRequest();  
    }else{
      throw _getExceptionFromResponse(_httpResponse);
    }
  }

  Future<void> _makeRequest()async{
    _httpResponse = await HTTPRequester.post(_httpRequest);
  }

  String _getAuthenticationTokenFromRequest(){
    return _httpResponse.body["token"];
  }
}