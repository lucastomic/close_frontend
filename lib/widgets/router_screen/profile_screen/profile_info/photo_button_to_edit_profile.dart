import 'package:close_frontend/widgets/util_widgets/circular_image_with_loader.dart';
import 'package:flutter/material.dart';

class PhotoButtonToEditProfile extends StatelessWidget {
  final String _imagePath;
  const PhotoButtonToEditProfile(this._imagePath);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _navigateToEditProfileScreen,
      child: Stack(
        children: [
          CircularImageWithLaoder(
            image: Image.network(_imagePath,fit: BoxFit.cover,), 
            diameter: 150
          ),
          const Positioned(
            right: 0,
            child: EditLogo()
          ),
        ],
      ),
    );
  }

  void _navigateToEditProfileScreen(){
    //TODO: implement
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