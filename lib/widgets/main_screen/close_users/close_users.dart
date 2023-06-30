import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/close_users/close_users_servic_port.dart';
import 'package:close_frontend/widgets/main_screen/close_users/close_users_from_stream.dart';
import 'package:flutter/material.dart';

class CloseUsers extends StatefulWidget {
  final ICloseUsersService _closeUsersService;

  const CloseUsers(this._closeUsersService);

  @override
  State<CloseUsers> createState() => _CloseUsersState();
}

class _CloseUsersState extends State<CloseUsers> {
  late final Stream<List<User>> _closeUsersStream;

  @override
  void initState() {
    _initializeStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CloseUsersFromStream(_closeUsersStream);
  }

  void _initializeStream() {
    _closeUsersStream = widget._closeUsersService.closeUsersStream;
  }
}
