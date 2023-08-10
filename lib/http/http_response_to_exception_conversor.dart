import 'package:close_frontend/http/http_response.dart';

import '../exceptions/internal_server_error.dart/internal_server_error.dart';
import '../exceptions/internet_connection/internet_connection_exception.dart';
import '../exceptions/timeout/timeout_exception.dart';

class HTTPResponseToExceptionConversor{
  static Exception? convert(HTTPResponse response){
    if(response.statusIsTimeout)return RenderizableTimeOutException();
    if(response.statusIsInternalServerError) return InternalServerErrorException();
    if(response.connectionError) return InternetConnectionException();
  }  
}