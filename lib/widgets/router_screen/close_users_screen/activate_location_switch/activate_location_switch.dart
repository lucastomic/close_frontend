import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:close_frontend/provider/location/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActivateLocationSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch.dual(
        first: true,
        second: false,
        current: context.watch<LocationProvider>().locationIsActive ?? false,  
        colorBuilder: (value)=>value ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).colorScheme.primary,
        innerColor: Theme.of(context).colorScheme.onPrimary,
        borderColor: Theme.of(context).colorScheme.secondary,
        borderWidth: 0,
        height: 40,
        indicatorSize: const Size(40,40),
        iconBuilder: (value){
          return value 
          ? Icon(Icons.gps_not_fixed, color: Theme.of(context).colorScheme.primary,) 
          : Icon(Icons.gps_off, color: Theme.of(context).colorScheme.onSecondary,)  ;
        },
        onChanged: (value) async {
          context.read<LocationProvider>().setLocationActivity(value);
        },
        loading: false,
    );
  }
}