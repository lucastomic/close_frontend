class HTTPResponse{
  int _statusCode;
  Map<String,String> _headers;
  Object? _body;
  HTTPResponse({
    required int statusCode, 
    required Map<String,String> headers, 
    Object? body}
  ):_statusCode = statusCode, _headers = headers, _body = body;

  get statusIsOK{
    return _statusCode == 200;  
  }

  get body{
    return _body;
  }
}