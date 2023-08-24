import 'package:close_frontend/domain/chat/message.dart';
import 'package:close_frontend/domain/chat/message_type.dart';
import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageBox extends StatefulWidget {
	final Message _message;

	MessageBox(this._message);

  @override
  State<MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  late MessageType _messageType;

  @override
  void initState() {
    _initalizeMessageType();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MessageBox oldWidget) {
    _initalizeMessageType();
    super.didUpdateWidget(oldWidget);
  }

	@override
	Widget build(BuildContext context) {
	  return _getMessageBoxAligned();
	}

  void _initalizeMessageType(){
    AuthenticationProvider authenticationProvider =  context.read<AuthenticationProvider>();
    _messageType =authenticationProvider.isUserAuthenticated(widget._message.sender) ? MessageType.sended : MessageType.received;
  }

  Widget _getMessageBoxAligned(){
      return _messageType == MessageType.sended ? 
      _alignToRight(_MessageBoxMisaligned(widget._message))
      : _alignToLeft(_MessageBoxMisaligned(widget._message));
  }

  Widget _alignToLeft(Widget widget){
    return Row(
	    children: [
	      widget,
        Expanded(child: Container())
	    ],
	  );
  }

  Widget _alignToRight(Widget widget){
    return Row(
	    children: [
        Expanded(child: Container()),
	      widget,
	    ],
	  );
  }
}

class _MessageBoxMisaligned extends StatelessWidget {
	final Message _message;
  final MessageType _messageType;

	_MessageBoxMisaligned(this._message,{MessageType messageType = MessageType.received}) : _messageType = messageType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(5),
      constraints: const BoxConstraints(maxWidth: 300),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Text(_message.value, style: TextStyle(color: Theme.of(context).primaryColor),),
    );
  }
}