import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/message_service/message_service_port.dart';
import 'package:close_frontend/widgets/message_screen/messages_list.dart';
import 'package:close_frontend/widgets/util_widgets/back_arrow.dart';
import 'package:close_frontend/widgets/util_widgets/circular_image_with_loader.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  final User _user;
  final IMessageService _messageService;

  const MessageScreen(this._user, this._messageService);

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        shadowColor: Colors.black,
        elevation: 2,
        toolbarHeight: 80,
        leadingWidth: 80,
        title: Row(
          children: [
            const BackArrowButton(),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircularImageWithLaoder(
                image: Image.network(_user.presentationImage),
                diameter: 50,
              ),
            ),
            Text(_user.profileName),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
        future: _messageService.getChat(_user),
        builder: (context, snapshot){
          if(snapshot.hasData){ 
            return MessagesList(snapshot.data!);
          }else{
            return Container();
          }
        } ,
      ),
    );
  }
}