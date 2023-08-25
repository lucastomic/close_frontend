import 'dart:async';
import 'package:close_frontend/provider/location/location_sender.dart';
import 'package:close_frontend/provider/location/needed_config.dart';
import 'package:close_frontend/services/location/location_service_port.dart';
import 'package:flutter/material.dart';

class LocationProvider extends ChangeNotifier {
  bool? _locationIsActive;
  final ILocationService _locationService;
  late LocationNeededConfig _neededConfig;
  late LocationSender _sender;

  LocationProvider(this._locationService){
    _neededConfig = LocationNeededConfig(_locationService);
    _sender = LocationSender(_locationService);
  }

  Future<void> init() async {
    if(_locationIsActive == null){
      await _neededConfig.init();
      await setLocationActivity(true);
      _listenIfNeededConfigTurnsOff();
    }
  }

  bool? get locationIsActive{
    return _locationIsActive;
  }

  Future<void> setLocationActivity(bool value) async {
    await _setLocationIsActive(value);
    _updateLocationSending();
    notifyListeners();
  }

  Future<void> _setLocationIsActive(bool value) async {
    value ? await _activateLocationIfIsPossible() : _locationIsActive = false;
  }

  void _updateLocationSending(){
    _locationIsActive! ? _sender.activateSending() : _sender.stopSending();
  }

  void _listenIfNeededConfigTurnsOff(){
    _neededConfig.turnedOffStream.listen((event) {
      if(_locationIsActive!)setLocationActivity(false);
    });
  }

  Future<void> _activateLocationIfIsPossible() async {
      await _neededConfig.tryToSetUp();
      _locationIsActive = _neededConfig.isSettedUp;
  }
}
