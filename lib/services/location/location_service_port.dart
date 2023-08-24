abstract class ILocationService{
  Future<void> sendLocation();
  Future<bool> checkNeededConfig();
  Future<bool> promptToEnableMissingConfig();
  void startLocationUpdating();
  void cancelLocationUpdating();
}
