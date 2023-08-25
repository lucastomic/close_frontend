import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomizedNaviagtionBar extends StatelessWidget {
  final Function(int) _onItemTapped;
  final int _initialIndex;

  const CustomizedNaviagtionBar({required Function(int) onItemTapped, required int initialIndex})
      : _onItemTapped = onItemTapped,
      _initialIndex = initialIndex;

  @override
  Widget build(BuildContext context) {
    return  GNav(
      selectedIndex: _initialIndex,
      onTabChange: _onItemTapped,
      color: Theme.of(context).colorScheme.secondary, // unselected icon color
      activeColor: Theme.of(context).colorScheme.primary, 
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      iconSize: 28,
      tabs: const [
        GButton(
          icon: Icons.supervised_user_circle_sharp,
          text: 'Cerca',
        ),
        GButton(
          icon: Icons.account_circle,
          text: 'Perfil',
        ),
      ]
     );
  }
}