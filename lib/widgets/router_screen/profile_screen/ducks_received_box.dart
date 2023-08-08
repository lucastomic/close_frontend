import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/widgets/duck/duck_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DucksReceivedBox extends StatefulWidget {
  @override
  State<DucksReceivedBox> createState() => _DucksReceivedBoxState();
}

class _DucksReceivedBoxState extends State<DucksReceivedBox> {
  late int _ducksReceived;

  @override
  void initState() {
    _ducksReceived = context.read<AuthenticationProvider>().ducksReceived;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DuckLogo.primary(width:130),
        Text(_ducksReceived.toString(),style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
        const SizedBox(width:150,height: 1, child: Divider()),
        const Text("patos recibidos",style: TextStyle(fontSize: 15),),
      ],
    );
  }
}