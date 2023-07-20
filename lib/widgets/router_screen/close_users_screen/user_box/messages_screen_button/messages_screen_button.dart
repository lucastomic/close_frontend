import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:close_frontend/widgets/chat_screen/chat_screen.dart';
import 'package:close_frontend/widgets/router_screen/current_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessagesScreenButton extends StatefulWidget {
  User _user;
  final IChatService _messageService;
  MessagesScreenButton(this._user, this._messageService);

  @override
  State<MessagesScreenButton> createState() => _MessagesScreenButtonState();
}

class _MessagesScreenButtonState extends State<MessagesScreenButton> {
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
    context.read<CurrentPageProvider>().currentPage = ChatScreen(widget._user, widget._messageService);
	}
}
