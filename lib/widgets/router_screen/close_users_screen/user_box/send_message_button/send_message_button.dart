import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/widgets/router_screen/current_page_provider.dart';
import 'package:close_frontend/widgets/user_screen/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SendMessageButton extends StatefulWidget {
  User _user;
  SendMessageButton(this._user);

  @override
  State<SendMessageButton> createState() => _SendMessageButtonState();
}

class _SendMessageButtonState extends State<SendMessageButton> {
	@override
	Widget build(BuildContext context) {
	  return MaterialButton(
      onPressed: _onPressed,
      child: Container(
			padding: const EdgeInsets.all(5),
          	margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Enviar mensaje",
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            )
        ),
	  );
	}

	void _onPressed(){
    context.read<CurrentPageProvider>().currentPage = UserScreen(widget._user);
	}
}
