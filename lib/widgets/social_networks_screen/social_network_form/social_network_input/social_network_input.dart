import 'package:close_frontend/domain/social_network/social_network.dart';
import 'package:close_frontend/widgets/forms/inputs/form_input.dart';
import 'package:close_frontend/widgets/forms/inputs/ui_widgets/decorated_input_container.dart';
import 'package:flutter/material.dart';

class SocialNetworkInput extends StatefulWidget implements FormInput<String?>{
  final SocialNetwork _socialNetwork;
  final String? _initialValue;
  final GlobalKey<SocialNetworkInputState> key = GlobalKey();
  SocialNetworkInput(this._socialNetwork, {String? initialValue}):_initialValue = initialValue;

  @override
  State<SocialNetworkInput> createState() => SocialNetworkInputState();
  
  @override
  bool isValid() {
    return true;
  }
  
  @override
  void validate() {}

  @override
  String? get value => key.currentState!._value == "" ? null :  key.currentState!._value;
}

class SocialNetworkInputState extends State<SocialNetworkInput> {
  String? _value ;
  @override
  void initState() {
    _value = widget._initialValue;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DecoratedInputContainer(
      child: TextFormField(
          initialValue: widget._initialValue,
          decoration:_getInputDecoration(),
          onChanged: (String? value)=>_value = value,
      )
    );
  }

  InputDecoration _getInputDecoration(){
    return InputDecoration( 
      label: Text(widget._socialNetwork.name),
      border:InputBorder.none,
      prefixIcon: Container(
        padding: const EdgeInsets.all(8),
        width: 10, 
        child: widget._socialNetwork.logo
      )
    );
  }
}
