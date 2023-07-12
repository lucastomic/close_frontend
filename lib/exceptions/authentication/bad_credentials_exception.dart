import 'package:close_frontend/exceptions/exception_with_message.dart';

class BadCredentialsException extends ExceptionWithMessage{
  BadCredentialsException(String message) : super(message);
}