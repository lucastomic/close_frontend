import 'package:close_frontend/domain/user/authenticated_user.dart';
import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/services/duck_service/duck_service_port.dart';
import 'package:close_frontend/widgets/duck/duck_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DuckButton extends StatefulWidget {
  IDuckService _duckService;
  User _receiver;

  DuckButton(this._duckService, this._receiver);


  @override
  State<DuckButton> createState() => _DuckButtonState();
}

class _DuckButtonState extends State<DuckButton> {
  late bool _sended;
  final double _buttonWidth = 36;
  late final AuthenticatedUser _authenticatedUser;

  @override
  void initState() {
    _authenticatedUser = context.read<AuthenticationProvider>().authenticatedUser;
    _sended = _authenticatedUser.hasSentDuckTo(widget._receiver);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: _sended ? DuckLogo.primary(width: _buttonWidth) : DuckLogo.grey(width: _buttonWidth),
      onTap: () {
        if(_sended){
          widget._duckService.removeDuck(widget._receiver);
          _authenticatedUser.removeDuckSent(widget._receiver);
        }else{
          widget._duckService.sendDuck(widget._receiver); 
          _authenticatedUser.addDuckSent(widget._receiver);
        }
        setState(() {
          _sended = !_sended;
        });
      },
    );
  }
}