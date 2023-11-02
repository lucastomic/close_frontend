import 'dart:async';
import 'dart:convert';
import 'package:close_frontend/config/enviroment.dart';


import 'package:close_frontend/services/location/location_service_port.dart';
import 'package:close_frontend/websockets/web_socket_sender.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';


@Injectable(as: ILocationService)
class LocationService implements ILocationService{
  final Location _locationServiceController = Location();
  late WebSocketSender _webSocketSender;

  LocationService(){
    _locationServiceController.enableBackgroundMode(enable: true); 
    _initalizeWebSocketSender();
  }

  @override
  Future<void> sendLocation() async {
    LocationData location = await _locationServiceController.getLocation();
    _webSocketSender.send(
      headers: {"Content-Type":"application/json"},
      body: jsonEncode({
        "latitude":location.latitude,
        "longitude":location.longitude
      })
    );
  }

  @override
  void closeLocationSending() {
    _webSocketSender.close();
  }

  @override
  Future<bool> checkNeededConfig() async {
    return await _isServiceEnable() && await _hasPermission(); 
  }

  @override
  Future<bool> promptToEnableMissingConfig() async{
      bool userEnabledService = await _promptToEnableServiceIfIsMissing();
      if(!userEnabledService) return false;
      bool userHasGivenPermissions = await _promptToGivePermissionIfMissing();
      return userHasGivenPermissions;
  }

  Future<bool> _promptToGivePermissionIfMissing() async {
    if(!await _hasPermission()){ 
      return await _promptToGivePermission();
    }
    return true;
  }

  Future<bool> _promptToEnableServiceIfIsMissing() async {
    if(!await _isServiceEnable()){ 
      return await _promptToEnableService();
    }
    return true;
  }

  Future<bool> _isServiceEnable()async{
    return await _locationServiceController.serviceEnabled();
  }

  Future<bool> _hasPermission()async{
    return (await _locationServiceController.hasPermission()) == PermissionStatus.granted;
  }

  Future<bool> _promptToEnableService()async{
    return await _locationServiceController.requestService();
  }

  Future<bool> _promptToGivePermission() async {
    PermissionStatus permissionGranted = await _locationServiceController.requestPermission();
    return permissionGranted == PermissionStatus.granted;
  }


  void _initalizeWebSocketSender(){
    _webSocketSender = WebSocketSender(
      destination: "/app/location", 
      url: "ws://$serverURL/socket", 
    );
  }


}