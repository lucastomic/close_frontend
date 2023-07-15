import 'package:close_frontend/domain/user/user.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  final User _user;
  UserScreen(this._user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar( 
            pinned: true,
            expandedHeight: 260.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,  
              title: Text(_user.username),
              background: FittedBox(
                fit:BoxFit.cover,   
                child: Image.network(_user.presentationImage)
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
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