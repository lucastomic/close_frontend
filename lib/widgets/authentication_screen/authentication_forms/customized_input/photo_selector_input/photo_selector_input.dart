import 'package:close_frontend/image_manage/image_picker/image.dart';
import 'package:close_frontend/image_manage/image_picker/image_picker_port.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_forms/customized_input/form_input.dart';
import 'package:close_frontend/widgets/authentication_screen/authentication_forms/customized_input/photo_selector_input/photo_selector_input_ui.dart';
import 'package:flutter/material.dart';

class PhotoInputSelctor extends StatefulWidget implements FormInput{
  final ImagePickerPort _imagePicker;

  @override
  final GlobalKey<PhotoInputSelctorState> key = GlobalKey();

  PhotoInputSelctor(this._imagePicker, {super.key});

  @override
  State<PhotoInputSelctor> createState() => PhotoInputSelctorState();

  @override
  bool isValid() {
	  return key.currentState!._isValid;
  }

  @override
  void validate() {
	  key.currentState!._validate();
  }

  @override
  get value => key.currentState!._imageSelected!.path;
}

class PhotoInputSelctorState extends State<PhotoInputSelctor> {
	ImageFromDevice? _imageSelected;
	bool _isValid = true;

	@override
	Widget build(BuildContext context) {
		return Column(
		  children: [
		    MaterialButton(
		      onPressed: _onPressed,
		      child: PhotoSelectorInputUI(_imageSelected, _isValid)
		    )
		  ],
		);
	}

	void _validate(){
	  setState(() { 
		  _isValid = _imageSelected != null;
	  });
	}

  void _onPressed()async{
    ImageFromDevice? imagePicked = await widget._imagePicker.pickImage();
    if(imagePicked != null){
      _selectImage(imagePicked);
    }
    setState(() {});
  } 

  _selectImage(ImageFromDevice image){
    _imageSelected = image;
    widget._imagePicker.defaultImage = image;
  }

}
