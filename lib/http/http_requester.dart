import 'package:close_frontend/http/request.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HTTPRequester {
  late final Request _request;
  late http.Response _response;

  static Future<Map<String, dynamic>> get(Request request) async {
    HTTPRequester httpRequester = HTTPRequester._internal(request);
    return httpRequester._makeRequest(_getRequest);
  }

  static Future<Map<String, dynamic>> post(Request request) async {
    HTTPRequester httpRequester = HTTPRequester._internal(request);
    return httpRequester._makeRequest(_postRequest);
  }

  HTTPRequester._internal(this._request);

  Future<Map<String, dynamic>> _makeRequest(Future<http.Response> Function(Uri) makeRequest) async {
    var url = _getRequestDecoded();
    _response = await makeRequest(url);
    if (_responseSuccess()) {
      return _getResponseDecoded();
    } else {
      throw Exception(_response.body);
    }
  }

  static Future<http.Response> _getRequest(Uri uri) {
    return http.get(uri);
  }

  static Future<http.Response> _postRequest(Uri uri) {
    return http.post(uri);
  }

  bool _responseSuccess() {
    return _response.statusCode == 200;
  }

  Uri _getRequestDecoded() {
    return Uri.http(_request.url, _request.unencodedPath, _request.queryParameters);
  }

  Map<String, dynamic> _getResponseDecoded() {
    return convert.jsonDecode(_response.body) as Map<String, dynamic>;
  }
}
