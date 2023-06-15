import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/close_users/close_users_servic_port.dart';
import 'package:close_frontend/services/close_users/close_users_service.dart';
import 'package:close_frontend/widgets/close_users/close_users_from_stream.dart';
import 'package:flutter/material.dart';

class CloseUsers extends StatefulWidget {
  @override
  State<CloseUsers> createState() => _CloseUsersState();
}

class _CloseUsersState extends State<CloseUsers> {
  final ICloseUsersService _closeUsersService = CloseUsersService();
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
    _closeUsersStream = _closeUsersService.closeUsersStream;
  }
}
