abstract class IAuthenticationLocalStorage{
  Future<void> setAuthToken(String token);
  Future<String?> getAuthToken();
  Future<void> cleanAuthToken();
}