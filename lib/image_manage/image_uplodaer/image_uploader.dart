import 'dart:convert';
import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_requester.dart';
import 'package:close_frontend/image_manage/image_uplodaer/image_uploader_port.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:ImageUploaderPort)
class ImageUploader implements ImageUploaderPort{
  final String _uploadPreset = "hwyixjzf";
  final int _apiKey = 715479738731197;
  final String _apiURL = 'api.cloudinary.com';
  final String  _apiUndecodedPath = '/v1_1/da9uye5mo/image/upload';

  @override
  Future<String> uploadImage(String imagePath)async{ 
    HTTPRequest request = HTTPRequest(
      url: _apiURL,
      unencodedPath:_apiUndecodedPath,
    );
    Map<String,String> fields = {
      "api_key": _apiKey.toString(),
      "upload_preset": _uploadPreset
    };
    var response = await HTTPRequester.multiPartRequest(request, imagePath, fields);
    return response.body["secure_url"];
  }
}