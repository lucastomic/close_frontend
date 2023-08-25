import 'package:flutter/material.dart';

class UbicationOffMessageBox extends StatelessWidget {
  const UbicationOffMessageBox({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.gps_off_outlined,color: Theme.of(context).colorScheme.primary, size: 160,),
        const Text(
          "Los usuarios cercanos no pueden ser vistos si la ubicación está desactivada. Ellos tampoco podran verte a ti.", 
          textAlign: TextAlign.center, 
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
