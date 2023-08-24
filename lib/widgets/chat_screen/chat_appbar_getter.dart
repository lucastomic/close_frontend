import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/widgets/util_widgets/back_arrow.dart';
import 'package:close_frontend/widgets/util_widgets/circular_image_with_loader.dart';
import 'package:flutter/material.dart';

class ChatAppBarGetter{
  static getAppBar(BuildContext context, User user){
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      toolbarHeight: 80,
      forceMaterialTransparency: true,
      leadingWidth: 80,
      title: Row(
        children: [
          const BackArrowButton(),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircularImageWithLaoder(
              image: Image.network(user.presentationImage),
              diameter: 50,
            ),
          ),
          Text(user.profileName),
        ],
      ),
      automaticallyImplyLeading: false,
    );
  }  
}