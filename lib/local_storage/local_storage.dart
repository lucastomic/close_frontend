import 'package:close_frontend/local_storage/local_storage_port.dart';
import 'package:injectable/injectable.dart';
import 'package:localstorage/localstorage.dart' ;

@Injectable(as: IAuthenticationLocalStorage)
class AuthenticationLocalStorage extends IAuthenticationLocalStorage{
  final String _file = "authentication.json";
  final String _authTokenKey = "authToken";

  late final LocalStorage _storage;

  AuthenticationLocalStorage(){
    _storage = LocalStorage(_file);
  }

  @override
  Future<void> cleanAuthToken() async {
    await _storage.ready;
    _storage.deleteItem(_authTokenKey);
  }

  @override
  Future<String?> getAuthToken() async {
    await _storage.ready;
    return _storage.getItem(_authTokenKey);
  }

  @override
  Future<void> setAuthToken(String token) async {
    await _storage.ready;
    _storage.setItem(_authTokenKey, token);
  }

}