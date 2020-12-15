import 'package:flutter/material.dart';

class CustomNavigatorBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentIndex = 0;

    return BottomNavigationBar(
      currentIndex: currentIndex,
        elevation: 10,
        backgroundColor: Colors.blueGrey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
          BottomNavigationBarItem(icon: Icon(Icons.compass_calibration), label: 'Direcciones'),
        ]
    );
  }
}
