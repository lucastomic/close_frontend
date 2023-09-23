import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:close_frontend/exceptions/exception_with_message.dart';
import 'package:close_frontend/services/navigation/navigation_service.dart';
import 'package:close_frontend/services/notifications_service/notification.dart' as notification;
import 'package:flutter/material.dart';

class SnackbarDisplayer{
  static const String _errorTitle = "¡Vaya!";

  static void displayException(ExceptionWithMessage exception){
      _showSnackbar(
        AwesomeSnackbarContent(
          message: exception.message, 
          title: _errorTitle,
          contentType: ContentType.failure,
        ),
        NavigationService.navigatorKey.currentContext!
      );
  }  

  static void displayNotification(notification.Notification n){
      BuildContext context = NavigationService.navigatorKey.currentContext!;
      final snackBar = SnackBar(
        content: Text(n.body),
        backgroundColor: Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }  

  static void _showSnackbar(AwesomeSnackbarContent content, BuildContext context){
      SnackBar snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: content
      );  
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
  }
}