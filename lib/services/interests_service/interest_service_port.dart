abstract class IInterestService{
  Future<void> addInterest(String interestName);
  Future<void> removeInterest(String interestName);
}