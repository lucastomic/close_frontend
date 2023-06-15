import 'package:close_frontend/widgets/close_users/close_users.dart';
import 'package:close_frontend/widgets/close_users/close_users_from_stream.dart';
import 'package:close_frontend/widgets/profile/profile.dart';
import 'package:close_frontend/widgets/settings/settings_list.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _displayOptions = [const SettingsList(), CloseUsers(), const Profile()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings"),
            BottomNavigationBarItem(icon: Icon(Icons.gps_fixed), label: "close"),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "settings")
          ],
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
        ),
        body: _displayOptions.elementAt(_selectedIndex));
  }
}
