import 'package:close_frontend/widgets/util_widgets/decored_button/decored_button.dart';
import 'package:flutter/material.dart';

class ModifySocialNetworksButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedButton.primaryColor(
      context: context, 
      text: "Modificar redes sociales",
      onPressed: (){
        Navigator.of(context).pushNamed("socialNetworks");
      },
    );
  }
}
