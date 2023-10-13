import 'package:close_frontend/domain/user/authenticated_user.dart';
import 'package:close_frontend/services/authentication_service/create_user_request_data.dart';
import 'package:close_frontend/services/authentication_service/login_user_request_data.dart';


abstract class IAuthenticationService {
  Future<String> registerAndGetToken(CreateUserRequestData requestData);
  Future<String> tokenFromLogin(LoginUserRequestData requestData);
  Future<AuthenticatedUser> getUserFromToken(String token);
}
