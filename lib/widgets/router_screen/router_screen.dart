import 'package:close_frontend/image_manage/image_quality_reducer/image_quality_reducer.dart';
import 'package:close_frontend/provider/location/location_provider.dart';
import 'package:close_frontend/services/close_users/close_users_servic_port.dart';
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/close_users_screen.dart';
import 'package:close_frontend/widgets/router_screen/current_page_provider.dart';
import 'package:close_frontend/widgets/router_screen/customized_bottom_navigation_bar.dart';
import 'package:close_frontend/widgets/router_screen/profile_screen/profile_screen.dart';
import 'package:close_frontend/widgets/router_screen/settings/settings_list.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

@Injectable()
class RouterScreen extends StatefulWidget {
  final IChatService _messageService;
  final ICloseUsersService _closeUsersService;
  final ImageQualityReducer _qualityReducer;

  RouterScreen(this._closeUsersService, this._qualityReducer, this._messageService);

  @override
  State<RouterScreen> createState() => _RouterScreenState();
}

class _RouterScreenState extends State<RouterScreen> {
  late List<Widget> _displayOptions;
  late CurrentPageProvider _currentPage;
  final int _initalPageIndex =1;

  @override
  void initState() {
    _initDisplayOptions();
    _initCurrentPageProvider();
    _initLocationProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async=>false,
      child: Scaffold(
        bottomNavigationBar: CustomizedNaviagtionBar( 
          initialIndex: _initalPageIndex,
          onItemTapped: _onItemTapped,
        ),
        body: context.watch<CurrentPageProvider>().currentPage
      ),
    );
  }

  void _onItemTapped(int index) {
    _currentPage.currentPage = _displayOptions[index];
  }

  void _initCurrentPageProvider(){
    _currentPage = context.read<CurrentPageProvider>();
    _currentPage.defaultAndCurrentPage = _displayOptions[_initalPageIndex];
  }

  void _initDisplayOptions(){
    _displayOptions = [
      const SettingsList(), 
      CloseUsersScreen(widget._closeUsersService,widget._qualityReducer, widget._messageService), 
      const ProfileScreen()
    ];
  }

  void _initLocationProvider(){
    LocationProvider provider = context.read<LocationProvider>();
    provider.init();
  }
}
