import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_requester.dart';
import 'package:close_frontend/services/authentication_service/authentication_service_port.dart';
import 'package:close_frontend/services/authentication_service/create_user_request_data.dart';
import 'package:close_frontend/services/authentication_service/login/login_token_retriever.dart';
import '../../exceptions/authentication/bad_credentials_exception.dart';

class AuthenticationService extends IAuthenticationService {

  @override
  Future<User> register(CreateUserRequestData requestData) async {
    HTTPRequest request = HTTPRequest.toServer(unencodedPath: "/auth/register", queryParameters: requestData.toJson());
    Map<String, dynamic> response = (await HTTPRequester.post(request)).body;
    HTTPRequester.authenticationToken = response["token"];
    return response["token"];
  }

  @override
  Future<User> login(String username, String password) async {
    try{
      String authenticationToken = await LoginTokenRetriever.getTokenFromLogin(username, password);
      HTTPRequester.authenticationToken = authenticationToken;
      return _getUserFromToken(authenticationToken);
    }on BadCredentialsException{
      rethrow;
    }
  } 

  Future<User> _getUserFromToken(String token)async {
    HTTPRequest request = HTTPRequest.toServer(unencodedPath: "/users/getUserInfo");
    Map<String, dynamic> response = (await HTTPRequester.get(request)).body;
    return User.fromJson(response);
  }

}
