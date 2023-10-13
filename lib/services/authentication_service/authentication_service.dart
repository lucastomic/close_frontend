import 'package:close_frontend/domain/user/authenticated_user.dart';
import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_requester.dart';
import 'package:close_frontend/image_manage/image_uploader/image_uploader_port.dart';
import 'package:close_frontend/services/authentication_service/login_user_request_data.dart';
import 'package:close_frontend/services/authentication_service/port/authentication_service_port.dart';
import 'package:close_frontend/services/authentication_service/create_user_request_data.dart';
import 'package:close_frontend/services/authentication_service/token_retriever/login_token_retriever.dart';
import 'package:close_frontend/services/authentication_service/token_retriever/register_token_retriever.dart';
import 'package:close_frontend/services/notifications_service/notification_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IAuthenticationService)
class AuthenticationService extends IAuthenticationService {
  final ImageUploader _imageUploader;
  final NotificationService _notificationService;
  AuthenticationService(this._imageUploader,this._notificationService);

  @override
  Future<String> registerAndGetToken(CreateUserRequestData requestData) async {
    requestData.photo = await _uploadUserPhoto(requestData);
    requestData.notificationDeviceid = await _notificationService.getNotificationDeviceId();
    RegisterTokenRetriever registerTokenRetriever = RegisterTokenRetriever();
    String authenticationToken = await registerTokenRetriever.getToken(requestData);
    return authenticationToken;
  }

  @override
  Future<String> tokenFromLogin(LoginUserRequestData requestData) async {
    LoginTokenRetriever loginTokenRetriever = LoginTokenRetriever();
    requestData.deviceID = await _notificationService.getNotificationDeviceId();
    String authenticationToken = await loginTokenRetriever.getToken(requestData);
    return authenticationToken;
  } 

  @override
  Future<AuthenticatedUser> getUserFromToken(String token)async {
    HTTPRequest request = HTTPRequest.toServer(unencodedPath: "/users/getUserInfo");
    Map<String, dynamic> response = (await HTTPRequester.get(request)).body;
    return AuthenticatedUser.fromJson(response);
  }

  Future<String> _uploadUserPhoto(CreateUserRequestData requestData)async{
    return await _imageUploader.uploadImage(requestData.photo!);
  }
}
 