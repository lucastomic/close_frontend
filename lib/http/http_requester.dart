import 'package:close_frontend/http/http_response.dart';
import 'package:close_frontend/http/request.dart';
import 'package:http/http.dart' as http;

class HTTPRequester {
  final Request _request;
  late Uri _requestCodedIntoURI;
  late http.Response _response; 
  static String? _authenticationToken;

  static Future<HTTPResponse> get(Request request) async {
    HTTPRequester httpRequester = HTTPRequester._internal(request);
    return httpRequester._makeGenericRequest(httpRequester._makeGETRequest);
  }

  static Future<HTTPResponse> post(Request request) async {
    HTTPRequester httpRequester = HTTPRequester._internal(request);
    return httpRequester._makeGenericRequest(httpRequester._makePOSTRequest);
  }

  static set authenticationToken(String token){
    _authenticationToken = token;
  }

  HTTPRequester._internal(this._request);

  Future<HTTPResponse> _makeGenericRequest(Future<void> Function() makeSpecificRequest) async {
    _authenticateRequestIfTokenExists();
    _setRequestCodedIntoURI();
    await makeSpecificRequest();
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

  HTTPResponse _getResponseDecoded() {
    return HTTPResponse(statusCode: _response.statusCode, headers: _response.headers, body: _response.body);
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
