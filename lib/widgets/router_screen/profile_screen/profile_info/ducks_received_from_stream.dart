import 'package:close_frontend/widgets/router_screen/profile_screen/ducks_received_box.dart';
import 'package:flutter/material.dart';

class DucksReceivedFromStream extends StatelessWidget {
  final int _initalValue;
  final Stream<int> _stream;
  DucksReceivedFromStream(Stream<int> stream, int initalValue):
  _initalValue = initalValue,
  _stream = stream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _stream,
      initialData:_initalValue,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {  
        return DucksReceivedBox(snapshot.data); 
      },
    );
  }
}
