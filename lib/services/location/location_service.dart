import 'dart:async';
import 'dart:convert';

import 'package:close_frontend/exceptions/internal_server_error.dart/internal_server_error.dart';
import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_requester.dart';
import 'package:close_frontend/http/http_response.dart';
import 'package:close_frontend/services/location/location_service_port.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';


@Injectable(as: ILocationService)
class LocationService implements ILocationService{
  LocationData? _lastLocation;
  final int _intervalForLocationSendingInSeconds = 1;
  final Location _locationServiceController = Location();
  Timer? _timerSender;

  LocationService(){
    _locationServiceController.enableBackgroundMode(enable: true); 
  }

  @override
  void startLocationSending() {
    _timerSender = Timer.periodic(
      Duration(seconds: _intervalForLocationSendingInSeconds),
      _updateandSendLocation
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

  void _updateandSendLocation(_)async{
      await _updateLocation();
      await _sendLocation();  
  }

  Future<bool> _hasPermission()async{
    return (await _locationServiceController.hasPermission()) == PermissionStatus.granted;
  }

  Future<bool> _askForPermission() async {
    PermissionStatus permissionGranted = await _locationServiceController.requestPermission();
    return permissionGranted == PermissionStatus.granted;
  }


  Future<void> _updateLocation()async{
    _lastLocation = await _locationServiceController.getLocation();
  }

  Future<void> _sendLocation() async {
    HTTPRequest request = HTTPRequest.toServer(
      unencodedPath: "/users/location",
      headers: {"Content-Type":"application/json"},
      body: jsonEncode({
        "latitude":_lastLocation!.latitude,
        "longitude":_lastLocation!.longitude
      })
    );
    HTTPResponse response =  await HTTPRequester.post(request);
    if (!response.statusIsOK){
      throw InternalServerErrorException();
    }
  }

}