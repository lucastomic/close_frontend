import 'dart:io';

import 'package:close_frontend/image_manage/image_picker/image.dart';
import 'package:close_frontend/widgets/forms/inputs/ui_widgets/input_box_shadows.dart';
import 'package:close_frontend/widgets/util_widgets/circular_image_with_loader.dart';
import 'package:flutter/material.dart';

class PhotoSelectorInputUI extends StatelessWidget {
  final ImageFromDevice? _imageToShow;
  final bool _isValid;
  const PhotoSelectorInputUI(this._imageToShow, this._isValid);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Foto de perfil",
          style: TextStyle(color: _isValid ? Colors.grey : Theme.of(context).colorScheme.error),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Theme.of(context).primaryColor,
            boxShadow: InputBoxShadows.getInputBoxShadows() 
          ),	
          child:  _imageToShow == null ? 
          _AddPhotoIcon(): 
          _SelectedImageWithLoader(_imageToShow!)
        )
      ],
    );
  }
}

class _AddPhotoIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 70,
      height: 70,
      child: Icon(
        Icons.add_a_photo_outlined,
        color: Colors.grey
      ),
    );
  }
}

class _SelectedImageWithLoader extends StatelessWidget {
  final ImageFromDevice _imageToShow;
  const _SelectedImageWithLoader( this._imageToShow);
  @override
  Widget build(BuildContext context) {
    return CircularImageWithLaoder(
      image: Image.file(File(_imageToShow.path),fit: BoxFit.cover) , 
      diameter: 90
    );
  }
}