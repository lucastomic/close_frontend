abstract class ILocationService{
  Future<void> sendLocation();
  void closeLocationSending();
  Future<bool> checkNeededConfig();
  Future<bool> promptToEnableMissingConfig();
}
