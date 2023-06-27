import 'package:flutter/material.dart';

class PopUpAlertDisplayer{  
  late final BuildContext _context;
  late final String _title;
  late final String _message;

  static showAlert(BuildContext context, String title,String message){
    PopUpAlertDisplayer displayer = PopUpAlertDisplayer._internal(context, title, message);
    displayer._showAlert();
  }

  PopUpAlertDisplayer._internal(this._context,this._title,this._message);

  Future<void> _showAlert() async {
    return showDialog<void>(
      context: _context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return _getAlertDialog();
      },
    );
  }

  Widget _getAlertDialog(){
    return AlertDialog(
      title: Image.asset("assets/images/sad_panda.png"),
      content: SingleChildScrollView(
        child: Text(_message),
      ),
      actions: <Widget>[
        _getOkButton(),
      ],
    );
  }

  Widget _getOkButton(){
    return TextButton(
      child: const Text('Ok'),
      onPressed: () {
        Navigator.of(_context).pop();
      },
    );
  }
}  