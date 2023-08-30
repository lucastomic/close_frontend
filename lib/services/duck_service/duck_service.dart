import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/exceptions/exception_with_message.dart';
import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_requester.dart';
import 'package:close_frontend/http/http_response.dart';
import 'package:close_frontend/services/duck_service/duck_service_port.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:IDuckService)
class DuckService implements IDuckService{
  @override
  Future<void> removeDuck(User user) async {
    HTTPRequest request = HTTPRequest.toServer(
      unencodedPath: "/users/ducks/reclaim",
      queryParameters: {
        "receiverId":user.id
      }
    );
    HTTPResponse response = await HTTPRequester.delete(request);
    if( !response.statusIsOK){
      throw ExceptionWithMessage("El pato no pudo ser enviado con éxito");
    }
  }

  @override
  Future<void> sendDuck(User user) async {
    HTTPRequest request = HTTPRequest.toServer(
      unencodedPath: "/users/ducks/send",
      queryParameters: {
        "receiverId":user.id
      }
    );
    HTTPResponse response = await HTTPRequester.post(request);
    if( !response.statusIsOK){
      throw ExceptionWithMessage("El pato no pudo ser enviado con éxito");
    }
  }
  
}