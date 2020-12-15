import 'package:flutter/material.dart';

class CustomScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 10,
        focusColor: Colors.blueAccent,
        child: Icon(Icons.filter_center_focus),
        onPressed: () {
          print('hola');
        });
  }
}
