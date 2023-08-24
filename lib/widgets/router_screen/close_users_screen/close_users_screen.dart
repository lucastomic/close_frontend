import 'dart:io';

import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/image_manage/image_quality_reducer/image_quality_reducer.dart';
import 'package:close_frontend/provider/location/location_provider.dart';
import 'package:close_frontend/services/close_users/close_users_servic_port.dart';
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/close_users_from_stream.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/close_users_header.dart';
import 'package:close_frontend/widgets/util_widgets/centred_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CloseUsersScreen extends StatefulWidget {
  final ICloseUsersService _closeUsersService;
  final ImageQualityReducer _qualityReducer;
  final IChatService _messageService;
  const CloseUsersScreen(this._closeUsersService, this._qualityReducer,this._messageService);

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
    return SafeArea(
      child: Column(
        children: [
          CloseUsersHeader(),
          FutureBuilder(
            future:  context.read<LocationProvider>().init(),
            builder: (_,snpashot){
              if(snpashot.connectionState == ConnectionState.waiting){ 
                return const CentredCircularProgressIndicator();
              }
              return context.watch<LocationProvider>().locationIsActive
              ? CloseUsersFromStream(_closeUsersStream, widget._qualityReducer, widget._messageService)
              : Text("TODO: MOSTRAR ERROR");
            }
          )
        ],
      ),
    );
  }

  void _initializeStream(BuildContext context) {
    _closeUsersStream = widget._closeUsersService.openCloseUsersSubscription(context);
  }

  void _closeStream(){
    widget._closeUsersService.closeCloseUsersSubscription();
  }
}

