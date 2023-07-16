import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/widgets/user_screen/user_app_bar/user_app_bar.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  final User _user;
  UserScreen(this._user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          UserAppBar(_user),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: Colors.white,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}