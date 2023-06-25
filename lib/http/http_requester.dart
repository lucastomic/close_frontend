import 'package:close_frontend/http/request.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HTTPRequester {
  late final Request _request;
  late Uri _requestCodedIntoURI;
  late http.Response _response;

  static Future<Map<String, dynamic>> get(Request request) async {
    HTTPRequester httpRequester = HTTPRequester._internal(request);
    return httpRequester._makeGenericRequest(httpRequester._makeGETRequest);
  }

  static Future<Map<String, dynamic>> post(Request request) async {
    HTTPRequester httpRequester = HTTPRequester._internal(request);
    return httpRequester._makeGenericRequest(httpRequester._makePOSTRequest);
  }

  HTTPRequester._internal(this._request);

  Future<Map<String, dynamic>> _makeGenericRequest(Future<http.Response> Function() makeSpecificRequest) async {
    _requestCodedIntoURI = _getRequestCodedIntoURI();
    _response = await makeSpecificRequest();
    if (_responseSuccess()) {
      return _getResponseDecoded();
    } else {
      throw Exception(_response.body);
    }
  }

  Future<http.Response> _makeGETRequest() {
    return http.get(_requestCodedIntoURI,headers: _request.headers);
  }

  Future<http.Response> _makePOSTRequest() {
    return http.post(_requestCodedIntoURI,headers: _request.headers, body: _request.body);
  }

  bool _responseSuccess() {
    return _response.statusCode == 200;
  }

  Uri _getRequestCodedIntoURI() {
    return Uri.http(_request.url, _request.unencodedPath, _request.queryParameters);
  }

  Map<String, dynamic> _getResponseDecoded() {
    return convert.jsonDecode(_response.body) as Map<String, dynamic>;
  }
}
