
import 'package:flutter/material.dart';

class SocialNetworksScreenHeader extends StatelessWidget {
  const SocialNetworksScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      child: Text(
        "¡Sube las redes sociales que quieras mostrar a los demás!", 
        textAlign: TextAlign.center,  
        style: TextStyle(fontSize: 25, color: Theme.of(context).colorScheme.secondary), 
    )
    );
  }
}