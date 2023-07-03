import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/close_users/close_users_servic_port.dart';
import 'package:close_frontend/widgets/main_screen/close_users_screen/close_users_from_stream.dart';
import 'package:close_frontend/widgets/main_screen/close_users_screen/close_users_header.dart';
import 'package:flutter/material.dart';

class CloseUsersScreen extends StatefulWidget {
  final ICloseUsersService _closeUsersService;

  const CloseUsersScreen(this._closeUsersService);

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
  Widget build(BuildContext context) {
    return Column(
      children: [
		CloseUsersHeader(),
        CloseUsersFromStream(_closeUsersStream),
      ],
    );
  }

  void _initializeStream(BuildContext context) {
    _closeUsersStream = widget._closeUsersService.closeUsersStream(context);
  }
}

