import 'package:close_frontend/widgets/message_screen/send_message_form/message_input.dart';
import 'package:close_frontend/widgets/message_screen/send_message_form/send_message_button.dart';
import 'package:flutter/material.dart';

class SendMessageForm extends StatelessWidget {
  const SendMessageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child:Padding(
        padding: const EdgeInsets.only(top:8.0,right: 8,left: 8),
        child: Row(
          children: [
            MessageInput(),
            Container(
              margin:const EdgeInsets.symmetric(horizontal:5),
              child: SendMessageButton()
            )
          ],
        ),
      )
    );
  }
}

