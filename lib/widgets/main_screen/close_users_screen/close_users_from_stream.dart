import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/widgets/main_screen/close_users_screen/users_list.dart';
import 'package:flutter/material.dart';

class CloseUsersFromStream extends StatelessWidget {
  final Stream<List<User>> _stream;

  const CloseUsersFromStream(this._stream, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<User>>(

      stream: _stream,
      builder: _buildWidgetFromSnapshot,
    );
  }

  Widget _buildWidgetFromSnapshot(_, AsyncSnapshot<List<User>> snapshot) {
    if (_snapshotHasLoaded(snapshot)) {
      return UsersList(snapshot.data!);
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  bool _snapshotHasLoaded(AsyncSnapshot<List<User>> snapshot) {
    return snapshot.hasData;
  }
}

