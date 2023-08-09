import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/user_box/messages_screen_button/messages_screen_button.dart';
import 'package:close_frontend/widgets/user_screen/interests_list/interest_list.dart';
import 'package:close_frontend/widgets/user_screen/user_app_bar/user_app_bar.dart';
import 'package:close_frontend/widgets/util_widgets/social_networks_list.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  final User _user;
  final IChatService _messageService;
  const UserScreen(this._user,this._messageService);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:SizedBox(height: 70 ,child: MessagesScreenButton(_user,_messageService)) ,
      body: CustomScrollView(
        slivers: [
          UserAppBar(_user),  
          SliverList( 
            delegate: SliverChildListDelegate(
              [
                _CentredAndFixed(
                  SocialNetworksList(_user.socialNetworks, logoSize: 30, fontSize: 20, spaceBetweenRows: 24,), 200),
                InterestList(_user.interests),
                const SizedBox(height: 70,)
              ]
            ),
          ),
        ],
      ),
    );
  }
}

class _CentredAndFixed extends StatelessWidget {
  final Widget _child;
  final double _width;
  const _CentredAndFixed(this._child,this._width);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        SizedBox(
          width:_width,
          child:_child  
        ),
        const Spacer(),
      ],
    );
  }
}