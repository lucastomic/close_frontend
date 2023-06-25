
import 'package:close_frontend/services/authentication_service/create_user_request_data.dart';

import '../../domain/user/user.dart';

abstract class IAuthenticationService {
  Future<User> register(CreateUserRequestData requestData);
  Future<User> login(String username, String password);
}
