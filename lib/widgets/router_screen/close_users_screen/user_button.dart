import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/image_manage/image_quality_reducer/image_quality_reducer.dart';
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:close_frontend/services/duck_service/duck_service_port.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/user_box/user_box.dart';
import 'package:close_frontend/widgets/user_screen/user_screen.dart';
import 'package:flutter/material.dart';

class UserButton extends StatelessWidget {
  final User _user;
  final ImageQualityReducer _qualityReducer;
  final IChatService _messageService;
  final IDuckService _duckService;
  const UserButton({
    required User user, 
    required ImageQualityReducer qualityReducer, 
    required IChatService messageService,
    required IDuckService duckService
  }) : 
  _user = user, 
  _qualityReducer = qualityReducer, 
  _messageService = messageService,
  _duckService = duckService;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>UserScreen(_user, _messageService, _duckService)));
      },
      child: UserBox(_user, _qualityReducer)
    );
  }
}
