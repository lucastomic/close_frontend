import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/message_service/message_service_port.dart';
import 'package:close_frontend/widgets/forms/custom_form.dart';
import 'package:close_frontend/widgets/message_screen/message_appbar_getter.dart';
import 'package:close_frontend/widgets/message_screen/messages_future_builder.dart';
import 'package:flutter/material.dart';

import 'send_message_form/send_message_form.dart';

class MessageScreen extends StatelessWidget {
  final User _user;
  final IMessageService _messageService;

  const MessageScreen(this._user, this._messageService);

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar:MessageAppBarGetter.getAppBar(context,_user),
      body: Column(
        children: [
          MessagesFutureBuilder(_messageService.getChat(_user)),  
          SendMessageForm()
        ],
      )
    );
  }
}
