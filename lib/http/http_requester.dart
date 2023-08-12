import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:close_frontend/exceptions/internal_server_error.dart/internal_server_error.dart';
import 'package:close_frontend/exceptions/internet_connection/internet_connection_exception.dart';
import 'package:close_frontend/exceptions/timeout/timeout_exception.dart';
import 'package:close_frontend/http/http_response.dart';
import 'package:close_frontend/http/http_request.dart';
import 'package:http/http.dart' as http;

class HTTPRequester {
  final HTTPRequest _request;
  late Uri _requestCodedIntoURI;
  late HTTPResponse _response; 

  static String? _authenticationToken;
  final Duration _defaultTimeOut = const Duration(seconds: 15);

  static Future<HTTPResponse> get(HTTPRequest request) async {
    HTTPRequester httpRequester = HTTPRequester._internal(request);
    return httpRequester._makeRequest(httpRequester._makeGETRequest);
  }

  static Future<HTTPResponse> post(HTTPRequest request) async {
    HTTPRequester httpRequester = HTTPRequester._internal(request);
    return httpRequester._makeRequest(httpRequester._makePOSTRequest);
  }

  static Future<HTTPResponse> delete(HTTPRequest request) async {
    HTTPRequester httpRequester = HTTPRequester._internal(request);
    return httpRequester._makeRequest(httpRequester._makeDELETERequest);
  }

  static Future<HTTPResponse> put(HTTPRequest request) async {
    HTTPRequester httpRequester = HTTPRequester._internal(request);
    return httpRequester._makeRequest(httpRequester._makePUTRequest);
  }


  static set authenticationToken(String token){
    _authenticationToken = token;
  }

  HTTPRequester._internal(this._request);

  Future<HTTPResponse> _makeRequest(Future<http.Response> Function() makeSpecificRequest) async {
    _authenticateRequestIfTokenExists();
    _setRequestCodedIntoURI();
    await _setResponse(makeSpecificRequest);
    return _response;
  }

  Future<http.Response> _makeGETRequest() async{
    return await http.get(_requestCodedIntoURI,headers: _request.headers).timeout(_defaultTimeOut);

  }

  Future<http.Response> _makePOSTRequest()async {
    return await http.post(_requestCodedIntoURI,headers: _request.headers, body: _request.body).timeout(_defaultTimeOut);
  }

  Future<http.Response> _makeDELETERequest()async {
    return await http.delete(_requestCodedIntoURI,headers: _request.headers).timeout(_defaultTimeOut);
  }
  Future<http.Response> _makePUTRequest()async {
    return await http.put(_requestCodedIntoURI,headers: _request.headers, body: _request.body).timeout(_defaultTimeOut);
  }


  void _setRequestCodedIntoURI() {
    _requestCodedIntoURI =  Uri.http(
      _request.url,
      _request.unencodedPath, 
      _getParsedQueryParameters(),
    );
  }

  void _authenticateRequestIfTokenExists(){
    if(_authenticationToken == null) return;
    if(_requestContainsHeaders()){
      _addAuthenticationTokenToRequestHeaders();
    }else{
      _createHeadersToRequestWithAuthenticationToken();
    }
  }

  Future<void> _setResponse(Future<http.Response> Function() makeSpecificRequest)async{
    try{
      http.Response rawResponse = await makeSpecificRequest();
      _response = _parseResponse(rawResponse);
    }on TimeoutException{
      throw RenderizableTimeOutException();
    }on SocketException{
      throw InternalServerErrorException();
    }catch(e){
      throw InternetConnectionException();
    }
  }

  HTTPResponse _parseResponse(http.Response response) {
    return HTTPResponse(
      statusCode: response.statusCode,
      headers: response.headers, 
      body: _parseBody(response.body)
    );
  }

  Map<String,String>? _getParsedQueryParameters(){
    return _request.queryParameters?.map(_parseValueToString);
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

  MapEntry<String,String> _parseValueToString(String key, dynamic value){
    return MapEntry(key, value.toString());
  }
  
}
