import 'package:close_frontend/image_manage/image_picker/image_picker_port.dart';
import 'package:close_frontend/services/profile_photo/profile_photo_service_port.dart';
import 'package:close_frontend/widgets/router_screen/profile_screen/edit_photo_dialaog/edit_photo_dialaog.dart';
import 'package:close_frontend/widgets/util_widgets/circular_image_with_loader.dart';
import 'package:flutter/material.dart';

class PhotoButtonToEditProfile extends StatelessWidget {
  final String _imagePath;
  final ImagePickerPort _imagePicker;
  final IProfilePhotoService _photoService;
  const PhotoButtonToEditProfile(this._imagePath,this._imagePicker,this._photoService);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: ()=>_showEditPhotoDialog(context),
      child: Stack(
        children: [
          CircularImageWithLaoder(
            image: Image.network(_imagePath,fit: BoxFit.cover,), 
            diameter: 170
          ),
          const Positioned(
            right: 0,
            child: EditLogo()
          ),
        ],
      ),
    );
  }

  void _showEditPhotoDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (_){
        return EditPhotoDialog(_imagePicker,_photoService);
      }
    );
  }
}

class EditLogo extends StatelessWidget {
  const EditLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(100),
        color: Theme.of(context).colorScheme.onSecondary,
      ),
      child: const Icon(Icons.edit,color: Colors.black,),
    );
  }
}