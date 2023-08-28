import 'dart:async';
import 'dart:convert';
import 'package:close_frontend/config/config.dart';
import 'package:close_frontend/services/location/location_service_port.dart';
import 'package:close_frontend/services/navigation/navigation_service.dart';
import 'package:close_frontend/websockets/web_socket_sender.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';


@Injectable(as: ILocationService)
class LocationService implements ILocationService{
  LocationData? _lastLocation;
  final Location _locationServiceController = Location();
  late WebSocketSender _webSocketSender;
  StreamSubscription<LocationData>? _locationStreamSubscription;

  LocationService(){
    _locationServiceController.enableBackgroundMode(enable: true); 
    _initalizeWebSocketSender();
  }

  @override
  void startLocationUpdating()async{
    _lastLocation = await _locationServiceController.getLocation();
    _locationStreamSubscription = _locationServiceController.onLocationChanged.listen((LocationData location) {
        _lastLocation = location;
    });
  }

  @override
  void cancelLocationUpdating()async{
    _locationStreamSubscription?.cancel();
  }

  @override
  Future<void> sendLocation() async {
    _webSocketSender.send(
      headers: {"Content-Type":"application/json"},
      body: jsonEncode({
        "latitude":_lastLocation!.latitude,
        "longitude":_lastLocation!.longitude
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