class HTTPRequest {
  String url;
  String unencodedPath;
  Map<String, dynamic>? queryParameters;
  Map<String,String>? headers;
  Object? body;

  HTTPRequest({required this.url, this.unencodedPath = '', this.queryParameters, this.headers, this.body});
  HTTPRequest.toServer({this.unencodedPath ='', this.queryParameters,this.headers,this.body}): url = "172.18.243.90:8080";
}
