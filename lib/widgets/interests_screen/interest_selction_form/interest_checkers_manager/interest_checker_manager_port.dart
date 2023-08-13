import 'package:close_frontend/widgets/forms/inputs/form_input.dart';
import 'package:flutter/material.dart';

abstract class IInterestCheckerManager{
  Future<Map<String,FormInput<bool>>> getInterestCheckers(BuildContext context);
  Future<Map<String,FormInput<bool>> >getLastReturnedPlusSelected(String interest);
}