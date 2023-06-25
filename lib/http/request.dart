class Request {
  String url;
  String unencodedPath;
  Map<String, dynamic>? queryParameters;
  Map<String,String>? headers;
  Object? body;
  Request({required this.url, this.unencodedPath = '', this.queryParameters, this.headers, this.body});
}
