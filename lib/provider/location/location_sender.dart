import 'dart:async';
import 'package:close_frontend/services/location/location_service_port.dart';

class LocationSender{
  Timer? _timerSender;
  bool _isCurrentlySending = false;
  final int _sendingIntervalInSeconds = 2;
  final ILocationService _locationService;
  
  LocationSender(this._locationService);

  void activateSending(){ 
    if(!_isCurrentlySending){
      _locationService.startLocationUpdating();
      _startPeriodicSending();
      _isCurrentlySending = true;
    }
  }

  void stopSending(){
    if(_isCurrentlySending){
      _locationService.cancelLocationUpdating();
      _locationService.closeLocationSending();
      _timerSender?.cancel();
      _isCurrentlySending = false;
    }
  }

  void _startPeriodicSending(){
   _timerSender = Timer.periodic(Duration(seconds: _sendingIntervalInSeconds), (_) { 
      _locationService.sendLocation();
    });
  }
}
