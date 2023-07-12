class ExceptionWithMessage implements Exception {
  final String _message;
  ExceptionWithMessage(String message) : _message = message;
  get message{
    return _message;
  } 
}
