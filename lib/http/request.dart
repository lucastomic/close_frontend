class Request {
  String url;
  String unencodedPath;
  Map<String, dynamic>? queryParameters;

  Request({required this.url, this.unencodedPath = '', this.queryParameters});
}
