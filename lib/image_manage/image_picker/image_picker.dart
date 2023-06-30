import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'image.dart';
import 'image_picker_port.dart';

@Injectable(as: ImagePickerPort)
class ImagePickerImpl implements ImagePickerPort{
  ImageFromDevice? _defaultImage;
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _fileSelected;

  @override
  set defaultImage(ImageFromDevice img) {
    _defaultImage = img;
  }

  @override
  Future<ImageFromDevice?> pickImage()async{
    _fileSelected = await _pickImage();
    if(_noFileWasSelected())return _defaultImage; 
    return _getImageFromFileSelected();
  }

  
  bool _noFileWasSelected(){
	  return _fileSelected == null;
  }

  Future<XFile?> _pickImage()async{
	  return _imagePicker.pickImage(source: ImageSource.gallery);
  }

  ImageFromDevice _getImageFromFileSelected(){
	  return ImageFromDevice(_fileSelected!.path);
  }

}
