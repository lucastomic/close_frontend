abstract class IDuckStreamService{
  Stream<int> getDucksReceivedStream();
  void closeStream();
}