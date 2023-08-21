import 'package:close_frontend/services/location/location_service_port.dart';
import 'package:flutter/material.dart';

class LocationProvider extends ChangeNotifier {
  bool _locationIsActive = false;
  bool _isCurrentlySending = false;
  final ILocationService _locationService;

  LocationProvider(this._locationService);

  set locationIsActive(bool value){
    _locationIsActive = value;
    _updateLocationSending();
  }

  Future<void> init() async {
    await _initalizeLocationIsActive();
    _updateLocationSending();
  }

  Future<void> _initalizeLocationIsActive() async {
    bool serviceIsEnabled = await _locationService.tryToEnableService();
    bool hasPermissions = await _locationService.getPermission();
    _locationIsActive = serviceIsEnabled && hasPermissions;
  }

  void _updateLocationSending(){
    _locationIsActive ? _startSendingIfIsNot() : _stopSending();
  }

  void _startSendingIfIsNot(){ 
    if(!_isCurrentlySending){
      _locationService.startLocationSending();
      _isCurrentlySending = true;
    }
  }

  void _stopSending(){
    _isCurrentlySending =false;
    _locationService.stopLocationSending();
  }
}