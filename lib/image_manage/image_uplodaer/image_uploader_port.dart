abstract class ImageUploaderPort{
  ///Returns the URL where the photo was uploaded
  Future<String> uploadImage(String imagePath);
}