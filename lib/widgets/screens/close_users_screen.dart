import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/close_users/close_users_servic_port.dart';
import 'package:close_frontend/services/close_users/close_users_service.dart';
import 'package:close_frontend/widgets/users/close_users_list.dart';
import 'package:flutter/material.dart';

class CloseUsersScreen extends StatelessWidget {
  ICloseUsersService closeUsersService = CloseUsersService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Close",
      )),
      body: StreamBuilder<List<User>>(
          initialData: [
            User(
              profileName: "Lucas Tomic",
              username: "lucastomic",
              age: 19,
              photos: ["https://res.cloudinary.com/da9uye5mo/image/upload/v1665048100/bn6z32qufuz5xoxospmx.jpg"],
            )
          ],
          stream: closeUsersService.closeUsersStream,
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.data != null) {
              return CloseUsersList(snapshot.data!);
            } else
              return Container();
          }),
    );
  }
}
