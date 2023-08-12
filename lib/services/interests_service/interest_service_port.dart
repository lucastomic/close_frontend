abstract class IInterestService{
  Future<void> addInterest(String interestName);
  Future<void> removeInterest(String interestName); 
  Future<List<String>> getPopularInterests(int limit);
  Future<List<String>> getExcluding(List<String> exclude, int limit);
}