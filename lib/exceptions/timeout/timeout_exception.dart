import 'package:close_frontend/exceptions/exception_with_message.dart';

class RenderizableTimeOutException extends ExceptionWithMessage{
  RenderizableTimeOutException():super("Tiempo de espera agotado. Intente de nuevo más tarde.");  
}