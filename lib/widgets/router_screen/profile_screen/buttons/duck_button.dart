import 'package:close_frontend/domain/user/authenticated_user.dart';
import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/exceptions/exception_with_message.dart';
import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/services/duck_service/duck_service_port.dart';
import 'package:close_frontend/snackbar_displayer/snackbar_displayer.dart';
import 'package:close_frontend/widgets/duck/duck_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DuckButton extends StatefulWidget {
  final IDuckService _duckService;
  final User _receiver;

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
      onTap: () async {
        _toggleSended();
        try{
          await _sendOrRemoveDuck();
        }on ExceptionWithMessage catch(e){
          SnackbarDisplayer.displayException(e);
          _toggleSended();
        }
      },
    );
  }

  void _toggleSended(){ 
    setState(() {
      _sended = !_sended;
    });
  }
  Future<void> _sendOrRemoveDuck() async {
     _sended ? await _sendDuck() : await _removeDuck();
  } 

  Future<void> _removeDuck() async {
    await widget._duckService.removeDuck(widget._receiver);
    _authenticatedUser.removeDuckSent(widget._receiver);
  }

  Future<void> _sendDuck() async {
    await widget._duckService.sendDuck(widget._receiver); 
    _authenticatedUser.addDuckSent(widget._receiver);
  }
}