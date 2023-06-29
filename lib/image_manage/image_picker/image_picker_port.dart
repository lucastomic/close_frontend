import 'image.dart';

abstract class ImagePickerPort{
  Future<ImageFromDevice?> pickImage();
  set defaultImage(ImageFromDevice img);
}
