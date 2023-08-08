import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/widgets/router_screen/profile_screen/profile_info/profile_name_and_username.dart';
import 'package:flutter/material.dart';

class UserAppBar extends StatelessWidget {
  final User _user; 
  final double _maxHeight = 240.0;
  UserAppBar(this._user);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar( 
      automaticallyImplyLeading: false,
      pinned: true,
      expandedHeight: _maxHeight,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        title: _Title(_user),
        background: _getBackground(),
      )
    );
  }

  Widget _getBackground(){
    return FittedBox(
      fit:BoxFit.cover,   
      child: Image.network(_user.presentationImage)
    );
  }
}

class _Title extends StatelessWidget {
  final User _user; 
  _Title(this._user);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 60,
        decoration:_getTitleBackgroundDecoration(context),
        child: ProfileNameAndUsername(
          _user,
          usernameFontSize: 12,
          profileNameFontSize: 16,
        )
    );
  }

  BoxDecoration _getTitleBackgroundDecoration(BuildContext context){
    return BoxDecoration(gradient:_getTitleBackgroundGradient(context));
  }

  Gradient _getTitleBackgroundGradient(BuildContext context){
    return LinearGradient(
      stops: const [0.3,1],
      colors: [ 
        Theme.of(context).colorScheme.background,   
        Theme.of(context).colorScheme.background.withOpacity(0),   
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );
  }
}