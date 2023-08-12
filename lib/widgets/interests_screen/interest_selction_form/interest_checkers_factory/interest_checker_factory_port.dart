import 'package:close_frontend/widgets/forms/inputs/form_input.dart';
import 'package:flutter/material.dart';

abstract class IInterestCheckerFactory{
  Future<Map<String,FormInput<bool>>> getInterestCheckers(BuildContext context);
}