import 'package:close_frontend/image_manage/image_uploader/image_uploader_port.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:ImageUploader)
class CloudinaryImageUploader implements ImageUploader{
  final String _uploadPreset = "hwyixjzf";
  final String _cloudName = "da9uye5mo";
  late final CloudinaryPublic _cloudinary;

  CloudinaryImageUploader(){
    _initializeConfig();
  }

  @override
  Future<String> uploadImage(String imagePath)async{ 
    CloudinaryResponse response = await _uploadImage(imagePath);
    CloudinaryImage image = CloudinaryImage(response.url);
    return _getURLWithQualityReduced(image);
  }

  void _initializeConfig(){
    _cloudinary = CloudinaryPublic(_cloudName, _uploadPreset, cache: false);
  }

  Future<CloudinaryResponse> _uploadImage(String imagePath)async{
    return await _cloudinary.uploadFile(
      CloudinaryFile.fromFile(imagePath)
    );
  }

  String _getURLWithQualityReduced(CloudinaryImage image){
    return image.transform().quality("60").generate();
  }

}