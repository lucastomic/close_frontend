import 'package:close_frontend/image_manage/image_quality_reducer/image_quality_reducer.dart';
import 'package:close_frontend/services/close_users/close_users_servic_port.dart';
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/close_users_screen.dart';
import 'package:close_frontend/widgets/router_screen/customized_bottom_navigation_bar.dart';
import 'package:close_frontend/widgets/router_screen/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

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
  int _index =0;

  @override
  void initState() {
    _initDisplayOptions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async=>false,
      child: Scaffold(
        bottomNavigationBar: CustomizedNaviagtionBar( 
          initialIndex: _index,
          onItemTapped: _onItemTapped,
        ),
        body: _displayOptions[_index]
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  void _initDisplayOptions(){
    _displayOptions = [
      CloseUsersScreen(widget._closeUsersService,widget._qualityReducer, widget._messageService), 
      const ProfileScreen()
    ];
  }
}
