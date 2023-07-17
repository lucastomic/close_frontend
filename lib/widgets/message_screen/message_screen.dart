import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/widgets/util_widgets/back_arrow.dart';
import 'package:close_frontend/widgets/util_widgets/circular_image_with_loader.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  final User _user;
  const MessageScreen(this._user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        shadowColor: Colors.black,
        elevation: 2,
        toolbarHeight: 80,
        leadingWidth: 80,
        title: Row(
          children: [
            const BackArrowButton(),
            // Icon(Icons.arrow_back),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircularImageWithLaoder(
                image: Image.network(_user.presentationImage),
                diameter: 50,
              ),
            ),
            Text(_user.profileName),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
    );
  }
}