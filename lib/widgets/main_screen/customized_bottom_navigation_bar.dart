import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomizedNaviagtionBar extends StatelessWidget {
  final Function(int) _onItemTapped;
  final int _selectedIndex;

  const CustomizedNaviagtionBar({required Function(int) onItemTapped, required int selectedIndex})
      : _onItemTapped = onItemTapped,
        _selectedIndex = selectedIndex;

  @override
  Widget build(BuildContext context) {
    return  GNav(
      onTabChange: _onItemTapped,
      selectedIndex: _selectedIndex,
      color: Theme.of(context).colorScheme.secondary, // unselected icon color
      activeColor: Theme.of(context).colorScheme.primary, 
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      iconSize: 28,
      tabs: const [
        GButton(
          icon: Icons.settings,
          text: 'Ajustes',
        ),
        GButton(
          icon: Icons.gps_fixed,
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