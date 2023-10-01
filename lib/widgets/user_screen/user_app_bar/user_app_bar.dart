import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/duck_service/duck_service_port.dart';
import 'package:close_frontend/widgets/router_screen/profile_screen/buttons/duck_button.dart';
import 'package:close_frontend/widgets/router_screen/profile_screen/profile_info/profile_name_and_username.dart';
import 'package:flutter/material.dart';

class UserAppBar extends StatelessWidget {
  final User _user; 
  final double _maxHeight = 240.0;
  final IDuckService _duckService;
  const UserAppBar(this._user,this._duckService);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar( 
      automaticallyImplyLeading: false,
      pinned: true,
      expandedHeight: _maxHeight,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        centerTitle: true,
        title: _AppBarTitle(_user,_duckService),
        background: _getBackground(),
      )
    );
  }

  Widget _getBackground(){
    return Padding(
      padding: const EdgeInsets.only(bottom:40.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(40)),
        child: FittedBox(
          fit:BoxFit.cover,   
          child: Image.network(_user.presentationImage)
        ),
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  final User _user; 
  final IDuckService _duckService;
  const _AppBarTitle(this._user,this._duckService);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: _getBoxDecoration(context),
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileNameAndUsername(
            _user,
            usernameFontSize: 10,
            profileNameFontSize: 13,
          ),
          const SizedBox(width: 14,),
          DuckButton(_duckService, _user)
        ],
      )
    );
  }

  BoxDecoration _getBoxDecoration(BuildContext context){
    return BoxDecoration(
      color: Theme.of(context).colorScheme.background,
      borderRadius: BorderRadius.circular(15),
      boxShadow: _getBoxShadows()
    );
  }

  List<BoxShadow> _getBoxShadows(){
    return [BoxShadow(color: Colors.black.withOpacity(.3), offset: Offset(3, 3), blurRadius: .5)];
  }
}