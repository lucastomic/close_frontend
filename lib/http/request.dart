class Request {
  String url;
  String unencodedPath;
  Map<String, dynamic>? queryParameters;
  Map<String,String>? headers;
  Object? body;

  Request({required this.url, this.unencodedPath = '', this.queryParameters, this.headers, this.body});
  Request.toServer({this.unencodedPath ='', this.queryParameters,this.headers,this.body}): url = "10.0.2.2:8080";
}
