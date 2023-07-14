import 'package:close_frontend/image_manage/image_quality_reducer/image_quality_reducer.dart';
import 'package:close_frontend/services/close_users/close_users_servic_port.dart';
import 'package:close_frontend/widgets/main_screen/close_users_screen/close_users_screen.dart';
import 'package:close_frontend/widgets/main_screen/customized_bottom_navigation_bar.dart';
import 'package:close_frontend/widgets/main_screen/profile/profile.dart';
import 'package:close_frontend/widgets/main_screen/settings/settings_list.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class MainScreen extends StatefulWidget {
  final ICloseUsersService _closeUsersService;
  final ImageQualityReducer _qualityReducer;

  const MainScreen(this._closeUsersService, this._qualityReducer);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;
  late List<Widget> _displayOptions;

  @override
  void initState() {
    _displayOptions = [
      const SettingsList(), 
      CloseUsersScreen(widget._closeUsersService,widget._qualityReducer), 
      const Profile()
    ];
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
