import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/message_service/message_service_port.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/user_box/send_message_button/send_message_button.dart';
import 'package:close_frontend/widgets/user_screen/user_app_bar/user_app_bar.dart';
import 'package:close_frontend/widgets/util_widgets/social_networks_list.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  final User _user;
  final IMessageService _messageService;
  UserScreen(this._user,this._messageService);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          UserAppBar(_user),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [ 
                      SocialNetworksList(_user.socialNetworks, logoSize: 50, fontSize: 20,),
                      SendMessageButton(_user,_messageService),
                    ],
                  ),
                )
              ]
            ),
          ),
        ],
      ),
    );
  }
}