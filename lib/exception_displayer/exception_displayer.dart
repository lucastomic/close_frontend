import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:close_frontend/exceptions/exception_with_message.dart';
import 'package:flutter/material.dart';

class ExceptionDisplayer{
  static const String _errorTitle = "¡Vaya!";

  static void display(ExceptionWithMessage exception, BuildContext context){
      SnackBar snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          message: exception.message, 
          title: _errorTitle,
          contentType: ContentType.failure,
        ),
      );  
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
  }  
}