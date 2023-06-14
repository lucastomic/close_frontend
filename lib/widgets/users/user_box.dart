import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/widgets/users/user_information_column.dart';
import 'package:flutter/material.dart';

class UserBox extends StatelessWidget {
  final User _user;
  const UserBox(this._user);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(width: .3, color: Colors.black45)),
      margin: const EdgeInsets.only(bottom: 20, left: 25, right: 25),
      child: Row(
        children: [Image.network(_user.photos![0]), UserInformationColumn(_user)],
      ),
    );
  }
}
