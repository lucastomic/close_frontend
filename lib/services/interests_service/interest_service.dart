import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_requester.dart';
import 'package:close_frontend/http/http_response.dart';
import 'package:close_frontend/services/interests_service/interest_service_port.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IInterestService)
class InterestsService implements IInterestService{
  @override
  Future<void> addInterest(String interestName) async {
    HTTPRequest request = HTTPRequest.toServer(
      unencodedPath: "/users/addInterest/$interestName",
    );
    await HTTPRequester.put(request);
  }

  @override
  Future<void> removeInterest(String interestName) async{
    HTTPRequest request = HTTPRequest.toServer(
      unencodedPath: "/users/deleteInterest/$interestName",
    );
    HTTPResponse response = await HTTPRequester.delete(request);
    if(!response.statusIsOK){
      print("Error");
    }
  }

}