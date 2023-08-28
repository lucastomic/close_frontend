import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/image_manage/image_quality_reducer/image_quality_reducer.dart';
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:close_frontend/services/duck_service/duck_service_port.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/user_button.dart';
import 'package:flutter/material.dart';


class UsersButtonsList extends StatelessWidget {
  final List<User> _users;
  final ImageQualityReducer _qualityReducer;
  final IChatService _messageService;
  final IDuckService _duckService;
  const UsersButtonsList(List<User> users, ImageQualityReducer qualityReducer, IChatService messageService, IDuckService duckService)
  : _users = users, _qualityReducer = qualityReducer, _messageService = messageService, _duckService =duckService;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _users.length,
      itemBuilder: (_, int index){
        return UserButton(
          user:_users[index],
          qualityReducer:_qualityReducer,
          messageService:_messageService,
          duckService: _duckService,
        );
      }
    );
  }
}
