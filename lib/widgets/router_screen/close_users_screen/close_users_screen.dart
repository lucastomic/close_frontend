import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/image_manage/image_quality_reducer/image_quality_reducer.dart';
import 'package:close_frontend/services/close_users/close_users_servic_port.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/close_users_from_stream.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/close_users_header.dart';
import 'package:flutter/material.dart';

class CloseUsersScreen extends StatefulWidget {
  final ICloseUsersService _closeUsersService;
  final ImageQualityReducer _qualityReducer;
  const CloseUsersScreen(this._closeUsersService, this._qualityReducer);

  @override
  State<CloseUsersScreen> createState() => _CloseUsersScreenState();
}

class _CloseUsersScreenState extends State<CloseUsersScreen> {
  late final Stream<List<User>> _closeUsersStream;

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
    return Column(
      children: [
		    CloseUsersHeader(),
        CloseUsersFromStream(_closeUsersStream, widget._qualityReducer),
      ],
    );
  }

  void _initializeStream(BuildContext context) {
    _closeUsersStream = widget._closeUsersService.getCloseUsersStream(context);
  }

  void _closeStream(){
    widget._closeUsersService.closeCloseUsersSubscription();
  }
}

