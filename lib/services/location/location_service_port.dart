abstract class ILocationService{
  void startLocationSending();
  void stopLocationSending();
  Future<bool> tryToEnableService();
  Future<bool> getPermission();
}
