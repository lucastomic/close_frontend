import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/authentication_service/create_user_request_data.dart';

abstract class IAuthenticationService {
  Future<String> register(CreateUserRequestData requestData);
  Future<String> login(String username, String password);
  Future<User> getUserFromToken(String token);
}
