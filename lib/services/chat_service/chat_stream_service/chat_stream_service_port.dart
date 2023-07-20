import 'package:close_frontend/domain/chat/chat.dart';
import 'package:flutter/material.dart';

abstract class IChatStreamService{
  Stream<Chat> getChatStream(BuildContext context);
  void closeChatStream();
}