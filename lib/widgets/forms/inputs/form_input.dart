import 'package:flutter/material.dart';

abstract class FormInput extends Widget{
  // All inputs starts being valid when they are built, until
  // the client validates them
  bool isValid();
  void validate();
  String get value;
}
