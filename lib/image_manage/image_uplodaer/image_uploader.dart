import 'dart:convert';
import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_requester.dart';
import 'package:close_frontend/image_manage/image_uplodaer/image_uploader_port.dart';

class ImageUploader implements ImageUploaderPort{
  @override
  Future<String> uploadImage(String imagePath)async{ 
    HTTPRequest request = HTTPRequest(
      url: 'api.cloudinary.com/v1_1/da9uye5mo/image/upload?api_key=715479738731197&upload_preset=hwyixjzf',
      body: jsonEncode({'file':imagePath}),
      headers: {"Content-Type":"application/json"}
    );
    var response = await HTTPRequester.post(request);
    return response.body["secure_url"];
  }
}