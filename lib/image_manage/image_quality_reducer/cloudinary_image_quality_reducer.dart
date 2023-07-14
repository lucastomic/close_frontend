import 'package:close_frontend/image_manage/image_quality_reducer/image_quality_reducer.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:injectable/injectable.dart';

// NOTE: Using Cloudniary service obligates to enter a Cloudinary URL, what increments
// coupling a lot (we can't change uploading service without modifing the QualityReducer)
// We should use another library for quality reducing
@Injectable(as: ImageQualityReducer)
class CloudinaryImageQualityReducer implements ImageQualityReducer{
  @override
  String getURLWithReducedQuality(String url) {
    CloudinaryImage image = CloudinaryImage(url);
    return image.transform().quality("60").generate();
  }
}