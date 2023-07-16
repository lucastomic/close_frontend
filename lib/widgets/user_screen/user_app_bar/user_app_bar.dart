import 'package:close_frontend/domain/user/user.dart';
import 'package:flutter/material.dart';

class UserAppBar extends StatelessWidget {
  User _user; 
  final double _maxHeight = 300.0;
  UserAppBar(this._user);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar( 
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
          height: 45,
          decoration:_getTitleBackgroundDecoration(context),
          child: Text(
            _user.username,
            textAlign: TextAlign.center,
          )
      );
  }

  BoxDecoration _getTitleBackgroundDecoration(BuildContext context){
    return BoxDecoration(gradient:_getTitleBackgroundGradient(context));
  }

  Gradient _getTitleBackgroundGradient(BuildContext context){
    return LinearGradient(
      stops: const [0.2,0.6,1],
      colors: [ 
        Theme.of(context).colorScheme.onSecondary,   
        Theme.of(context).colorScheme.onSecondary.withOpacity(0.7),   
        Theme.of(context).colorScheme.onSecondary.withOpacity(0),   
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );
  }
}