import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/widgets/close_users/users_list.dart';
import 'package:flutter/material.dart';

class CloseUsersFromStream extends StatelessWidget {
  final Stream<List<User>> _stream;

  const CloseUsersFromStream(this._stream, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<User>>(
      initialData: _initalDataForTesting,
      stream: _stream,
      builder: _buildWidgetFromSnapshot,
    );
  }

  Widget _buildWidgetFromSnapshot(_, AsyncSnapshot<List<User>> snapshot) {
    if (_snapshotHasLoaded(snapshot)) {
      return UsersList(snapshot.data!);
    } else {
      return const CircularProgressIndicator();
    }
  }

  bool _snapshotHasLoaded(AsyncSnapshot<List<User>> snapshot) {
    return snapshot.hasData;
  }
}

//TODO: REMOVE
List<User> _initalDataForTesting = [
  User(
    profileName: "Cooper",
    username: "coopersindog",
    age: 3,
    photos: ["https://res.cloudinary.com/da9uye5mo/image/upload/v1665048100/bn6z32qufuz5xoxospmx.jpg"],
  ),
  User(
    profileName: "Otto",
    username: "ottoelperro",
    age: 2,
    photos: ["https://res.cloudinary.com/da9uye5mo/image/upload/v1665308955/ubthh4fjefwznzb5slme.jpg"],
  ),
];
