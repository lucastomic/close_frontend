import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/widgets/main_screen/close_users_screen/user_box/card_content.dart';
import 'package:close_frontend/widgets/main_screen/close_users_screen/user_box/presentation_image/user_box_presentation_image.dart';
import 'package:flutter/material.dart';

class UserBox extends StatelessWidget {
  final User _user;
  final double height = 150;

  const UserBox(this._user);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: _getDecoration(),
      margin: _getMargin(),
      child: Row(
        children: [
          UserBoxPresentationImage(_user.presentationImage), 
          UserBoxCardContent(_user)
        ],
      ),
    );
  }

  EdgeInsetsGeometry _getMargin() {
    return const EdgeInsets.only(bottom: 20, left: 25, right: 25);
  }

  BoxDecoration _getDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(width: .3, color: Colors.black45)
    );
  }
}
