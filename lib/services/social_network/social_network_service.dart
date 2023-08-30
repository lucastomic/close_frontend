import 'package:close_frontend/domain/social_network/social_network.dart';
import 'package:close_frontend/exceptions/exception_with_message.dart';
import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_requester.dart';
import 'package:close_frontend/services/social_network/port/social_network_service_port.dart';
import 'package:injectable/injectable.dart';

import '../../http/http_response.dart';

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
    HTTPResponse response = await HTTPRequester.post(request);
    if(!response.statusIsOK){
      throw ExceptionWithMessage("Las redes sociales no fueron actualizadas con éxito");
    }
  }
  
  @override
  Future<void> removeSocialNetwork(SocialNetwork socialNetwork)async {
    HTTPRequest request = HTTPRequest.toServer(
        unencodedPath: "/socialnetwork/remove",
        body: {
          //Server expects the ENUM in UpperCase format
          "socialNetwork":socialNetwork.name.toUpperCase(),
        }
    ); 
    HTTPResponse response = await HTTPRequester.post(request);
    if(!response.statusIsOK){
      throw ExceptionWithMessage("Las redes sociales no fueron actualizadas con éxito");
    }  
  }

}