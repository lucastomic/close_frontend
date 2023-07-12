import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class POSTMultipartRequest{
  final http.MultipartRequest _request;

  POSTMultipartRequest(Uri uri):
    _request = http.MultipartRequest("POST",uri);

  void addFields(Map<String,String> fields){
    fields.forEach((key, value) {
      _request.fields[key] = value;
    });
  }

  Future<void> addFile(String imagePath)async{
    _request.files.add(
      await _parsePathToMultipartFile(imagePath)
    );
  }

  Future<http.Response> send() async {
    final rawResponse = await _request.send();
    return await http.Response.fromStream(rawResponse);
  }

  Future<http.MultipartFile> _parsePathToMultipartFile(String path)async{
    return await http.MultipartFile.fromPath(
      'file', 
      path,
      contentType: MediaType('image', 'jpeg'),
    );
  }

}