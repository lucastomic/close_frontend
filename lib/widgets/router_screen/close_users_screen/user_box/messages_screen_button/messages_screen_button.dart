import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:close_frontend/widgets/chat_screen/chat_screen.dart';
import 'package:close_frontend/widgets/util_widgets/decored_button/decored_button.dart';
import 'package:flutter/material.dart';

class MessagesScreenButton extends StatefulWidget {
  final User _user;
  final IChatService _messageService;
  MessagesScreenButton(this._user, this._messageService);

  @override
  State<MessagesScreenButton> createState() => _MessagesScreenButtonState();
}

class _MessagesScreenButtonState extends State<MessagesScreenButton> {
	@override
	Widget build(BuildContext context) {
    return DecoratedButton.hollow(
      context: context, 
      text: "Enviar mensaje",
      onPressed: _onPressed,
    );
	}

	void _onPressed(){
    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ChatScreen(widget._user, widget._messageService)));
	}
}
