import 'package:close_frontend/http/request.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HTTPRequester {
  late final Request _request;
  late Uri _requestCodedIntoURI;
  late http.Response _response; 
  static String? _authenticationToken;

  static Future<Map<String, dynamic>> get(Request request) async {
    HTTPRequester httpRequester = HTTPRequester._internal(request);
    return httpRequester._makeGenericRequest(httpRequester._makeGETRequest);
  }

  static Future<Map<String, dynamic>> post(Request request) async {
    HTTPRequester httpRequester = HTTPRequester._internal(request);
    return httpRequester._makeGenericRequest(httpRequester._makePOSTRequest);
  }

  static set authenticationToken(String token){
    _authenticationToken = token;
  }

  HTTPRequester._internal(this._request);

  Future<Map<String, dynamic>> _makeGenericRequest(Future<void> Function() executeSpecificRequest) async {
    _authenticateRequestIfTokenExists();
    _setRequestCodedIntoURI();
    await executeSpecificRequest();
    if (_responseSuccess()) {
      return _getResponseDecoded();
    } else {
      throw Exception(_response.body);
    }
  }

  Future<void> _makeGETRequest() async{
    _response =  await http.get(_requestCodedIntoURI,headers: _request.headers);
  }

  Future<void> _makePOSTRequest()async {
    _response = await http.post(_requestCodedIntoURI,headers: _request.headers, body:_request.body);
  }

  void _setRequestCodedIntoURI() {
    _requestCodedIntoURI =  Uri.http(_request.url, _request.unencodedPath, _request.queryParameters);
  }

  void _authenticateRequestIfTokenExists(){
    if(_authenticationToken == null) return;
    if(_requestContainsHeaders()){
      _addAuthenticationTokenToRequestHeaders();
    }else{
      _createHeadersToRequestWithAuthenticationToken();
    }
  }

  bool _responseSuccess() {
    return _response.statusCode == 200;
  }

  Map<String, dynamic> _getResponseDecoded() {
    return convert.jsonDecode(_response.body) as Map<String, dynamic>;
  }

  bool _requestContainsHeaders(){
    return _request.headers != null;
  }
  void _addAuthenticationTokenToRequestHeaders(){
      _request.headers!.addAll({"Authorization": "Bearer $_authenticationToken"});
  }
  void _createHeadersToRequestWithAuthenticationToken(){
      _request.headers = {"Authorization": "Bearer $_authenticationToken"};
  }
}
