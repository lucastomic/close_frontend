import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_requester.dart';
import 'package:close_frontend/http/http_response.dart';
import 'package:close_frontend/services/duck_service/duck_service_port.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:IDuckService)
class DuckService implements IDuckService{
  @override
  Future<void> removeDuck(User user) {
    // TODO: implement removeDuck
    throw UnimplementedError();
  }

  @override
  Future<void> sendDuck(User user) async {
    HTTPRequest request = HTTPRequest.toServer(
      unencodedPath: "/users/ducks/send",
      queryParameters: {
        "id":user.id
      }
    );
    HTTPResponse response = await HTTPRequester.post(request);
    if(!response.statusIsOK){
      //TODO: HANDLE ERROR
    }
  }
  
}