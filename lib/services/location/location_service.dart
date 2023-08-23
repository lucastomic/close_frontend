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
  final int _intervalForLocationSendingInSeconds = 2;
  final Location _locationServiceController = Location();
  Timer? _timerSender;
  late WebSocketSender _webSocketSender;

  LocationService(){
    _locationServiceController.enableBackgroundMode(enable: true); 
  }

  @override
  void startLocationSending(){
    _initalizeWebSocketSender();
    _startLocationUpdating();
    _timerSender = Timer.periodic(
      Duration(seconds: _intervalForLocationSendingInSeconds),
      _sendLocation
    );
  }

  @override
  void stopLocationSending() {
    _timerSender?.cancel();
  }

  @override
  Future<bool> tryToEnableService()async{
    bool isEnabled =  await _locationServiceController.serviceEnabled();
    return isEnabled ||  await _locationServiceController.requestService();
  }


  @override
  Future<bool> getPermission()async{
    bool hasPermission = await _hasPermission();
    return hasPermission || await _askForPermission();
  }


  Future<bool> _hasPermission()async{
    return (await _locationServiceController.hasPermission()) == PermissionStatus.granted;
  }

  Future<bool> _askForPermission() async {
    PermissionStatus permissionGranted = await _locationServiceController.requestPermission();
    return permissionGranted == PermissionStatus.granted;
  }


  void _startLocationUpdating()async{
    _lastLocation = await _locationServiceController.getLocation();
    _locationServiceController.onLocationChanged.listen((LocationData location) {
        _lastLocation = location;
    });
  }

  void _initalizeWebSocketSender(){
    _webSocketSender = WebSocketSender(
      NavigationService.navigatorKey.currentContext!, 
      destination: "/app/location", 
      url: "ws://$serverURL/socket", 
    );
  }

  Future<void> _sendLocation(_) async {
    _webSocketSender.send(
      headers: {"Content-Type":"application/json"},
      body: jsonEncode({
        "latitude":_lastLocation!.latitude,
        "longitude":_lastLocation!.longitude
      })
    );
  }

}