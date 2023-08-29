import 'package:close_frontend/widgets/duck/duck_logo.dart';
import 'package:flutter/material.dart';

class DucksReceivedBox extends StatelessWidget {
  final int _ducksReceived;
  const DucksReceivedBox(this._ducksReceived);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal:20, vertical: 3),
          decoration: BoxDecoration(
            border: Border.all(width: .6),
            borderRadius: BorderRadius.circular(15)
          ),
          child: _DuckAndNumber(_ducksReceived),
        ),
      ],
    );
  }
}

class _DuckAndNumber extends StatelessWidget {
  final int _ducksReceived;
  const _DuckAndNumber(this._ducksReceived);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DuckLogo.primary(width:35),
        const SizedBox(width: 10,),
        Text(_ducksReceived.toString(),style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
        const SizedBox(width: 10,),
      ],
    );
  }
}