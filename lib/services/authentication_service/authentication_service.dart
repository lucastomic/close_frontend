import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_requester.dart';
import 'package:close_frontend/services/authentication_service/authentication_service_port.dart';
import 'package:close_frontend/services/authentication_service/create_user_request_data.dart';
import 'package:close_frontend/services/authentication_service/token_retriever/login_token_retriever.dart';
import 'package:close_frontend/services/authentication_service/token_retriever/register_token_retriever.dart';

class AuthenticationService extends IAuthenticationService {

  @override
  Future<User> register(CreateUserRequestData requestData) async {
      RegisterTokenRetriever registerTokenRetriever = RegisterTokenRetriever();
      String authenticationToken = await registerTokenRetriever.getToken(requestData);
      HTTPRequester.authenticationToken = authenticationToken;
      return _getUserFromToken(authenticationToken);
  }

  @override
  Future<User> login(String username, String password) async {
      LoginTokenRetriever loginTokenRetriever = LoginTokenRetriever();
      String authenticationToken = await loginTokenRetriever.getToken(username, password);
      HTTPRequester.authenticationToken = authenticationToken;
      return _getUserFromToken(authenticationToken);
  } 

  Future<User> _getUserFromToken(String token)async {
    HTTPRequest request = HTTPRequest.toServer(unencodedPath: "/users/getUserInfo");
    Map<String, dynamic> response = (await HTTPRequester.get(request)).body;
    return User.fromJson(response);
  }

}
