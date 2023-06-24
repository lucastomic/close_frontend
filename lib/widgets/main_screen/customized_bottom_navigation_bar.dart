import 'package:flutter/material.dart';

class CustomizedNaviagtionBar extends StatelessWidget {
  final Function(int) _onItemTapped;
  final int _selectedIndex;

  const CustomizedNaviagtionBar({required Function(int) onItemTapped, required int selectedIndex})
      : _onItemTapped = onItemTapped,
        _selectedIndex = selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings"),
        BottomNavigationBarItem(icon: Icon(Icons.gps_fixed), label: "close"),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "settings")
      ],
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
    );
  }
}
