
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:close_frontend/services/notifications_service/notification.dart';
import 'package:flutter/material.dart';

import '../domain/user/user.dart';

class MessageSnackbarData{
  BuildContext context;
  MessageNotification notification;
  IChatService chatService;

  MessageSnackbarData({
    required this.context,
    required this.notification,
    required this.chatService,
  });

  String get body{
    return notification.body;
  } 
  String get title{
    return notification.title;
  } 
  User get user{
    return notification.user;
  } 
}