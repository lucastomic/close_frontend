import 'package:flutter/material.dart';

abstract class FormInput<T> extends StatefulWidget{
  // All inputs starts being valid when they are built, until
  // the client validates them
  bool isValid()=>true;
  void validate(){}
  T get value;
}