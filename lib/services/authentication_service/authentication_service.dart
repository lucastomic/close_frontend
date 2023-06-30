import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_requester.dart';
import 'package:close_frontend/image_manage/image_uplodaer/image_uploader_port.dart';
import 'package:close_frontend/services/authentication_service/port/authentication_service_port.dart';
import 'package:close_frontend/services/authentication_service/create_user_request_data.dart';
import 'package:close_frontend/services/authentication_service/token_retriever/login_token_retriever.dart';
import 'package:close_frontend/services/authentication_service/token_retriever/register_token_retriever.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IAuthenticationService)
class AuthenticationService extends IAuthenticationService {
  final ImageUploaderPort _imageUploader;
  AuthenticationService(this._imageUploader);

  @override
  Future<User> register(CreateUserRequestData requestData) async {
      requestData.photo = await _uploadUserPhoto(requestData);
      RegisterTokenRetriever registerTokenRetriever = RegisterTokenRetriever();
      String authenticationToken = await registerTokenRetriever.getToken(requestData);
      HTTPRequester.authenticationToken = authenticationToken;
      return _getUserFromToken(authenticationToken);
  }

  Future<String> _uploadUserPhoto(CreateUserRequestData requestData)async{
    return await _imageUploader.uploadImage(requestData.photo!);
  }

  @override
  Future<User> login(String username, String password) async {
      LoginTokenRetriever loginTokenRetriever = LoginTokenRetriever();
      String authenticationToken = await loginTokenRetriever.getToken(username, password);
      HTTPRequester.authenticationToken = authenticationToken;
      return _getUserFromToken(authenticationToken);
  } 

  Future<User> _getUserFromToken(String token)async {
    HTTPRequest request = HTTPRequest.toServer(unencodedPath: "/users/getUserInfo");
    Map<String, dynamic> response = (await HTTPRequester.get(request)).body;
    return User.fromJson(response);
  }

}
 