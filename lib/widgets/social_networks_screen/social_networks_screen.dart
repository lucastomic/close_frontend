import 'package:close_frontend/widgets/forms/inputs/text_form_input.dart';
import 'package:flutter/material.dart';

class SocialNetworksScreen extends StatelessWidget {
  const SocialNetworksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(child: Column(
        children: [   
          TextFormInput(
            validate: (String )=>null, 
            hintText: "lucastomic", 
            labelText: "Instagram", 
            icon: Icons.abc, 
            key: GlobalKey()
          )
        ],
      )),
    );
  }
}