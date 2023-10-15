import 'package:close_frontend/exceptions/exception_with_message.dart';
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:close_frontend/services/navigation/navigation_service.dart';
import 'package:close_frontend/snackbar_displayer/message_snackbar_data.dart';
import 'package:close_frontend/widgets/chat_screen/chat_screen.dart';
import 'package:flutter/material.dart';
import '../domain/user/user.dart';
import '../services/notifications_service/notification.dart';

class SnackbarDisplayer{
  static void displayException(ExceptionWithMessage exception){
      BuildContext context = NavigationService.navigatorKey.currentContext!;
      final snackBar = SnackBar(
        content: Text(exception.message),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }  

  static void displayMessageNotification(MessageNotification n, IChatService chatService){
      BuildContext context = NavigationService.navigatorKey.currentContext!;
      MessageSnackbarData data = MessageSnackbarData(context: context, notification: n, chatService: chatService);
      final snackBar =_getMessageSnackbar(data);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }  

  static SnackBar _getMessageSnackbar(MessageSnackbarData data){
    return SnackBar(
      content: Text(data.body),
      backgroundColor: Theme.of(data.context).colorScheme.primary,
      action: SnackBarAction(
        label: "Ver", 
        onPressed: ()=>_navigateToChatScreen(data.context, data.user, data.chatService)
      )
    );
  }

  static void _navigateToChatScreen(BuildContext context, User user, IChatService chatService){
    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ChatScreen(user, chatService)));
  }
}

