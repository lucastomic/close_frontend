import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/http/http_requester.dart';
import 'package:close_frontend/http/request.dart';
import 'package:close_frontend/services/authentication_service/authentication_service_port.dart';
import 'package:close_frontend/services/authentication_service/create_user_request_data.dart';

class AuthenticationService extends IAuthenticationService {
  final String _urlAPI = "http://localhost:8080";

  @override
  Future<String> register(CreateUserRequestData requestData) async {
    Request request = Request(url: _urlAPI, unencodedPath: "/auth/register", queryParameters: requestData.toJson());
    Map<String, dynamic> response = await HTTPRequester.post(request);
    return response["token"];
  }

  @override
  Future<String> login(String username, String password) async {
    Request request = Request(url: _urlAPI, unencodedPath: "/auth/authenticate", body: {"username": username, "password": password});
    Map<String, dynamic> response = await HTTPRequester.post(request);
    return response["token"];
  }

  @override
  Future<User> getUserFromToken(String token) {
    // TODO: implement getUserFromToken
    throw UnimplementedError();
  }
}
