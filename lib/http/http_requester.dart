import 'dart:convert';
import 'package:close_frontend/http/post_multipart_request.dart';
import 'package:close_frontend/http/http_response.dart';
import 'package:close_frontend/http/http_request.dart';
import 'package:http/http.dart' as http;

class HTTPRequester {
  final HTTPRequest _request;
  late Uri _requestCodedIntoURI;
  late HTTPResponse _response; 
  static String? _authenticationToken;

  static Future<HTTPResponse> get(HTTPRequest request) async {
    HTTPRequester httpRequester = HTTPRequester._internal(request);
    return httpRequester._makeGenericRequest(httpRequester._makeGETRequest);
  }

  static Future<HTTPResponse> post(HTTPRequest request) async {
    HTTPRequester httpRequester = HTTPRequester._internal(request);
    return httpRequester._makeGenericRequest(httpRequester._makePOSTRequest);
  }

  static Future<HTTPResponse> multiPartRequest(HTTPRequest request, String imagePath, Map<String,String> fields) async {
    HTTPRequester httpRequester = HTTPRequester._internal(request);
    return httpRequester._makeGenericRequest(()=>httpRequester._makeMultipartRequest(imagePath, fields));
  }

  static set authenticationToken(String token){
    _authenticationToken = token;
  }

  HTTPRequester._internal(this._request);

  Future<HTTPResponse> _makeGenericRequest(Future<void> Function() makeSpecificRequest) async {
    _authenticateRequestIfTokenExists();
    _setRequestCodedIntoURI();
    await makeSpecificRequest();
    return _response;
  }

  Future<void> _makeGETRequest() async{
    http.Response rawResponse = await http.get(_requestCodedIntoURI,headers: _request.headers);
    _response =  _parseResponse(rawResponse);
  }

  Future<void> _makePOSTRequest()async {
    http.Response rawResponse = await http.post(_requestCodedIntoURI,headers: _request.headers, body: _request.body);
    _response =  _parseResponse(rawResponse);  
  }

  Future<void> _makeMultipartRequest(String imagePath, Map<String,String> fields)async {
    var request = POSTMultipartRequest(_requestCodedIntoURI);
    request.addFields(fields);
    request.addFile(imagePath);
    final response = await request.send();
    _response = HTTPResponse(statusCode: response.statusCode, headers: response.headers, body:_parseBody(response.body));
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

  HTTPResponse _parseResponse(http.Response response) {
    return HTTPResponse(
      statusCode: response.statusCode,
      headers: response.headers, 
      body: _parseBody(response.body)
    );
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

  Map<String,dynamic>? _parseBody(String? rawBody){
    if(rawBody == null) return null;
    try{
      return jsonDecode(rawBody);
    }catch(e){
      return {"message":rawBody};
    }
  }

}
