import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/user_box/messages_screen_button/messages_screen_button.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/user_box/user_information_column.dart';
import 'package:flutter/material.dart';

class UserBoxCardContent extends StatelessWidget {
  final IChatService _messageService;
	final User _user;
	const UserBoxCardContent(this._user, this._messageService);

	@override
	Widget build(BuildContext context) {
	  return Expanded(
	    child: Column(
		  children: [
		    UserInformationColumn(_user) ,
		    MessagesScreenButton(_user, _messageService)
		  ],
	    ),
	  );
	}
}
