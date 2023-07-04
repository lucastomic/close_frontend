import 'package:close_frontend/domain/social_network/social_network.dart';
import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_requester.dart';
import 'package:close_frontend/services/social_network/port/social_network_service_port.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ISocialNetworkService)
class SocialNetworkService extends ISocialNetworkService{

  @override
  Future<void> updateSocialNetwork(SocialNetwork socialNetwork, String username) async{
    HTTPRequest request = HTTPRequest.toServer(
        unencodedPath: "/socialnetwork/add",
        body: {
          //Server expects the ENUM in UpperCase format
          "socialNetwork":socialNetwork.name.toUpperCase(),
          "username":username
        }
    ); 
    await HTTPRequester.post(request);
    //TODO: HANDLE ERROR
  }
  
  @override
  Future<void> removeSocialNetwork(SocialNetwork socialNetwork)async {
    // TODO: implement removeSocialNetwork
  }

}