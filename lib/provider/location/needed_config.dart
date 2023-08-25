import 'dart:async';

import 'package:close_frontend/services/location/location_service_port.dart';

class LocationNeededConfig{
  final ILocationService _locationService;
  final int _timeConfigIsRevisedInSeconds = 4;
  final StreamController<bool> _turnedOffStream = StreamController();
  late bool _isSettedUp;
  
  LocationNeededConfig(this._locationService);

  Future<void> init() async {
    _isSettedUp  = await _locationService.checkNeededConfig();
    _listenTurnedOff();
  }
  
  Stream get turnedOffStream{
    return _turnedOffStream.stream;
  }

  bool get isSettedUp{
    return _isSettedUp;
  }

  Future<void> tryToSetUp() async {
    if(!_isSettedUp){
       _isSettedUp = await _locationService.promptToEnableMissingConfig();
    }
  }
  
  void _listenTurnedOff(){
    Timer.periodic(
      Duration(seconds: _timeConfigIsRevisedInSeconds), 
      _checkAndUpdateNeededConfig
    );
  }

  void _checkAndUpdateNeededConfig(_) async { 
    bool neededConfigIsOK = await _locationService.checkNeededConfig();
    if(!neededConfigIsOK){
      _turnedOffStream.add(true); 
    }
    _isSettedUp = neededConfigIsOK;
  }
}