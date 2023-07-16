import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/widgets/util_widgets/circular_image_with_loader.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  final User _user;
  const MessageScreen(this._user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: 80,
        title: Text(_user.profileName),
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: CircularImageWithLaoder(
            image: Image.network(_user.presentationImage),
            diameter: 200,
          ),
        ),
      ),
    );
  }
}