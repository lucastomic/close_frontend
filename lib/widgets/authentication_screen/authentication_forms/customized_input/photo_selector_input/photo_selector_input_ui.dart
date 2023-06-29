import 'dart:io';

import 'package:close_frontend/image_manage/image_picker/image.dart';
import 'package:flutter/material.dart';

import '../ui_widgets/input_box_shadows.dart';

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
    return Stack(
      alignment: Alignment.center,
      children: [
        const CircularProgressIndicator(),
        SizedBox( 
          width: 90,
          height: 90,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child:Image.file(File(_imageToShow.path),fit: BoxFit.cover) ,
          ),
        ),
      ],
    );
  }
}