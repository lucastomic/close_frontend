import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/image_manage/image_quality_reducer/image_quality_reducer.dart';
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:close_frontend/services/close_users/close_users_servic_port.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/users_buttons_list.dart';
import 'package:flutter/material.dart';

class CloseUsersFromStream extends StatefulWidget {
  final ImageQualityReducer _qualityReducer;
  final IChatService _messageService;
  final ICloseUsersService _closeUsersService;
  const CloseUsersFromStream(this._closeUsersService,this._qualityReducer, this._messageService, {super.key});

  @override
  State<CloseUsersFromStream> createState() => _CloseUsersFromStreamState();
}

class _CloseUsersFromStreamState extends State<CloseUsersFromStream> {
  late final Stream<List<User>> _stream;

  @override
  void initState() {
    _initializeStream(context);
    super.initState();
  }

  @override
  void dispose() {
    _closeStream();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<User>>(
      stream: _stream,
      builder: _buildWidgetFromSnapshot,
    );
  }

  Widget _buildWidgetFromSnapshot(_, AsyncSnapshot<List<User>> snapshot) {
    if (_snapshotHasLoaded(snapshot)) {
      return UsersButtonsList(snapshot.data!,widget._qualityReducer, widget._messageService);
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  bool _snapshotHasLoaded(AsyncSnapshot<List<User>> snapshot) {
    return snapshot.hasData;
  }
  void _initializeStream(BuildContext context) {
    _stream = widget._closeUsersService.openCloseUsersSubscription(context);
  }

  void _closeStream(){
    widget._closeUsersService.closeCloseUsersSubscription();
  }
}

