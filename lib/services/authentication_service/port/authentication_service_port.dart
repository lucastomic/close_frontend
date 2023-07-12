import 'package:close_frontend/domain/user/authenticated_user.dart';
import 'package:close_frontend/services/authentication_service/create_user_request_data.dart';


abstract class IAuthenticationService {
  Future<String> tokenFromRegister(CreateUserRequestData requestData);
  Future<String> tokenFromLogin(String username, String password);
  Future<AuthenticatedUser> getUserFromToken(String token);
}
