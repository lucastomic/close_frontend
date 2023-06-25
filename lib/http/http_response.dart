class HTTPResponse{
  final int _statusCode;
  Map<String,String> _headers;
  final Object? _body;  
  HTTPResponse({
    required int statusCode, 
    required Map<String,String> headers, 
    Object? body}
  ):_statusCode = statusCode, _headers = headers, _body = body;

  get statusIsOK{
    return _statusCode == 200;  
  }

  get statusIsBadRequest{
    return _statusCode == 400;  
  }

  get statusIsNotFound{
    return _statusCode == 404;  
  }

  get body{
    return _body;
  }
}