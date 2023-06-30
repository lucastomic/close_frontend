import 'package:close_frontend/services/close_users/close_users_servic_port.dart';
import 'package:close_frontend/widgets/main_screen/close_users/close_users.dart';
import 'package:close_frontend/widgets/main_screen/customized_bottom_navigation_bar.dart';
import 'package:close_frontend/widgets/main_screen/profile/profile.dart';
import 'package:close_frontend/widgets/main_screen/settings/settings_list.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final ICloseUsersService _closeUsersService;

  MainScreen(this._closeUsersService);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;
  late List<Widget> _displayOptions;

  @override
  void initState() {
    _displayOptions = [const SettingsList(), CloseUsers(widget._closeUsersService), const Profile()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomizedNaviagtionBar(
          onItemTapped: _onItemTapped,
          selectedIndex: _selectedIndex,
        ),
        body: SafeArea(child: _getSelectedOption()));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getSelectedOption() {
    return _displayOptions.elementAt(_selectedIndex);
  }
}
