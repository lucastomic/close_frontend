import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/user_box/messages_screen_button/messages_screen_button.dart';
import 'package:close_frontend/widgets/user_screen/interests_list/interest_list.dart';
import 'package:close_frontend/widgets/user_screen/user_app_bar/user_app_bar.dart';
import 'package:close_frontend/widgets/util_widgets/social_networks_list.dart';
import 'package:flutter/material.dart';
import 'package:sliver_fill_remaining_box_adapter/sliver_fill_remaining_box_adapter.dart';

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
          SliverFillRemainingBoxAdapter(
            child: Column(  
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                const _SubTitle("Redes sociales"),
                SocialNetworksList(_user.socialNetworks, logoSize: 28, fontSize: 16, spaceBetweenRows: 24,),
                const SizedBox(height: 20,),
                const _SubTitle("Intereses"),
                InterestList(_user.interests),
                const SizedBox(height: 70,),
              ]
            )
          ),
        ],
      ),
    );
  }
}

class _SubTitle extends StatelessWidget {
  final String _text;
  const _SubTitle(this._text,{super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: const EdgeInsets.only(left: 15),
        child: Text(_text, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
    );
  }
}