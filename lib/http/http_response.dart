class HTTPResponse{
  final int _statusCode;
  Map<String,String> _headers;
  final Map<String,dynamic>? _body;  

  HTTPResponse({
    required int statusCode, 
    Map<String,String> headers =const {}, 
    Map<String,dynamic>? body}
  ):_statusCode = statusCode, _headers = headers, _body = body;

  get statusIsOK{
    return _statusCodeStartsWith(2);  
  }
  bool _statusCodeStartsWith(int number){
    return _statusCode.toString()[0] == "$number";
  }

  get statusIsBadRequest{
    return _statusCode == 400;  
  }

  get statusIsNotFound{
    return _statusCode == 404;  
  }
  get statusIsConflict{
    return _statusCode == 409;  
  }
  get statusIsTimeout{
    return _statusCode == 408;  
  }

  get statusIsInternalServerError{
    return _statusCode == 500;
  }
  get body{
    return _body;
  }
}