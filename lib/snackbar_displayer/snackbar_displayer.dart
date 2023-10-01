import 'package:close_frontend/exceptions/exception_with_message.dart';
import 'package:close_frontend/services/navigation/navigation_service.dart';
import 'package:close_frontend/services/notifications_service/notification.dart' as notification;
import 'package:flutter/material.dart';

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

  static void displayNotification(notification.Notification n){
      BuildContext context = NavigationService.navigatorKey.currentContext!;
      final snackBar = SnackBar(
        content: Text(n.body),
        backgroundColor: Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }  


}