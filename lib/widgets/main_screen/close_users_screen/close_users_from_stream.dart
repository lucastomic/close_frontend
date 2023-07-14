import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/image_manage/image_quality_reducer/image_quality_reducer.dart';
import 'package:close_frontend/widgets/main_screen/close_users_screen/users_list.dart';
import 'package:flutter/material.dart';

class CloseUsersFromStream extends StatefulWidget {
  final Stream<List<User>> _stream;
  final ImageQualityReducer _qualityReducer;
  const CloseUsersFromStream(this._stream,this._qualityReducer, {super.key});

  @override
  State<CloseUsersFromStream> createState() => _CloseUsersFromStreamState();
}

class _CloseUsersFromStreamState extends State<CloseUsersFromStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<User>>(
      stream: widget._stream,
      builder: _buildWidgetFromSnapshot,
    );
  }

  Widget _buildWidgetFromSnapshot(_, AsyncSnapshot<List<User>> snapshot) {
    if (_snapshotHasLoaded(snapshot)) {
      return UsersList(snapshot.data!,widget._qualityReducer);
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  bool _snapshotHasLoaded(AsyncSnapshot<List<User>> snapshot) {
    return snapshot.hasData;
  }
}

