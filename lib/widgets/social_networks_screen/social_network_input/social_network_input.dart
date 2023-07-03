import 'package:close_frontend/domain/social_network/social_network.dart';
import 'package:close_frontend/widgets/forms/inputs/form_input.dart';
import 'package:close_frontend/widgets/forms/inputs/ui_widgets/decorated_input_container.dart';
import 'package:flutter/material.dart';

class SocialNetworkInput extends StatefulWidget implements FormInput{
  final SocialNetwork _socialNetwork;
  GlobalKey<SocialNetworkInputState> key = GlobalKey();
  SocialNetworkInput(this._socialNetwork);

  @override
  State<SocialNetworkInput> createState() => SocialNetworkInputState();
  
  @override
  bool isValid() {
    return true;
  }
  
  @override
  void validate() {}

  @override
  String? get value => key.currentState!._value;
}

class SocialNetworkInputState extends State<SocialNetworkInput> {
  String? _value;
  @override
  Widget build(BuildContext context) {
    return DecoratedInputContainer(
      child: TextFormField(
          decoration:_getInputDecoration(),
          onChanged: (String? value)=>_value = value,
      )
    );
  }

  InputDecoration _getInputDecoration(){
    return InputDecoration(
      border:InputBorder.none,
      prefixIcon: Container(
        padding: const EdgeInsets.all(8),
        width: 10, 
        child: widget._socialNetwork.logo
      )
    );
}
}
