import 'dart:convert';

import 'package:close_frontend/exceptions/internal_server_error.dart/internal_server_error.dart';
import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_requester.dart';
import 'package:close_frontend/http/http_response.dart';
import 'package:close_frontend/image_manage/image_uploader/image_uploader_port.dart';
import 'package:close_frontend/services/profile_photo/profile_photo_service_port.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IProfilePhotoService)
class ProfilePhotoService implements IProfilePhotoService{
  final ImageUploader _imageUploader;
  ProfilePhotoService(this._imageUploader);

  @override
  Future<String> modify(String imagePath) async {
    String imageURL = await _imageUploader.uploadImage(imagePath);
    HTTPRequest request = HTTPRequest.toServer(
      unencodedPath: "/users/editPhoto",
      body: jsonEncode({"imageURL": imageURL}), 
      headers: {"Content-Type":"application/json"}
    );
    HTTPResponse response =  await HTTPRequester.put(request);
    if(!response.statusIsOK){
      throw InternalServerErrorException();
    }
    return imageURL;
  }
}

