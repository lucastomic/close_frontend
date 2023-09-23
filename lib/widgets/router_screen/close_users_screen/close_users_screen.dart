import 'package:close_frontend/image_manage/image_quality_reducer/image_quality_reducer.dart';
import 'package:close_frontend/provider/location/location_provider.dart';
import 'package:close_frontend/services/close_users/close_users_servic_port.dart';
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:close_frontend/services/duck_service/duck_service_port.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/close_users_from_stream.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/close_users_header.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/ubication_off_message_box/ubication_off_message_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'activate_location_switch/activate_location_switch.dart';

class CloseUsersScreen extends StatefulWidget {
  final ICloseUsersService _closeUsersService;
  final ImageQualityReducer _qualityReducer;
  final IChatService _messageService;
  final IDuckService _duckService;
  const CloseUsersScreen(this._closeUsersService, this._qualityReducer,this._messageService,this._duckService);

  @override
  State<CloseUsersScreen> createState() => _CloseUsersScreenState();
}

class _CloseUsersScreenState extends State<CloseUsersScreen> {
  @override
  void initState() {
    context.read<LocationProvider>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CloseUsersHeader(),
          Expanded(
            child: context.watch<LocationProvider>().locationIsActive ?? false
            ? CloseUsersFromStream(widget._closeUsersService, widget._qualityReducer, widget._messageService,widget._duckService)
            : const UbicationOffMessageBox(),
          ),
          ActivateLocationSwitch(),
        ],
      ),
    );
  }
}


