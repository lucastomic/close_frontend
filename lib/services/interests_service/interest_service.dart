import 'dart:convert';

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
    await HTTPRequester.delete(request);
  }
  
  @override
  Future<List<String>> getPopularInterests(int limit)async {
    HTTPRequest request = HTTPRequest.toServer(
      unencodedPath: "/interests/getMostPopulars/$limit",
    );
    HTTPResponse response = await HTTPRequester.get(request);
    return _parseJsonResponse(response.body["message"]);

  }

  @override
  Future<List<String>> getExcluding(List<String> exclude,int limit) async {
    HTTPRequest request = HTTPRequest.toServer(
      unencodedPath: "/interests/getExcluding",
      queryParameters: {
        "limit":limit,
        "excluding":exclude.join(","),
      }
    );
    HTTPResponse response = await HTTPRequester.get(request);
    return _parseJsonResponse(response.body["message"]);
  }

  List<String> _parseJsonResponse(String response) {
    List<dynamic> jsonList = json.decode(response);

    List<String> parsedList = jsonList.map((item) {
      return item['name'] as String;
    }).toList();

    return parsedList;
  }
  

} 