import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/user_box/user_information_column.dart';
import 'package:flutter/material.dart';

class UserBoxCardContent extends StatelessWidget {
	final User _user;
	const UserBoxCardContent(this._user);

	@override
	Widget build(BuildContext context) {
	  return Expanded(
	    child: Column(
		  children: [
		    UserInformationColumn(_user) ,
		  ],
	    ),
	  );
	}
}
