import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/message_service/message_service_port.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/user_box/send_message_button/send_message_button.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/user_box/user_information_column.dart';
import 'package:flutter/material.dart';

class UserBoxCardContent extends StatelessWidget {
  final IMessageService _messageService;
	final User _user;
	const UserBoxCardContent(this._user, this._messageService);

	@override
	Widget build(BuildContext context) {
	  return Expanded(
	    child: Column(
		  children: [
		    UserInformationColumn(_user) ,
		    SendMessageButton(_user, _messageService)
		  ],
	    ),
	  );
	}
}
