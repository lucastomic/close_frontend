import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/image_manage/image_quality_reducer/image_quality_reducer.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/user_box/user_box.dart';
import 'package:close_frontend/widgets/user_screen/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../current_page_provider.dart';

class UserButton extends StatelessWidget {
  final User _user;
  final ImageQualityReducer _qualityReducer;
  const UserButton(User user, ImageQualityReducer qualityReducer) : _user = user, _qualityReducer = qualityReducer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.read<CurrentPageProvider>().currentPage = UserScreen(_user);
      },
      child: UserBox(_user, _qualityReducer)
    );
  }
}