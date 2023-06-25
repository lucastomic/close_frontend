class BadCredentialsException implements Exception{
  final String _message;
  BadCredentialsException(String message) : _message = message;
  get message{
    return _message;
  }
}