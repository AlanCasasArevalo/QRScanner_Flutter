import 'package:flutter/material.dart';
import 'package:qrscanner/pages/directions_page.dart';
import 'package:qrscanner/pages/history_map_page.dart';
import 'package:qrscanner/widgets/custom_navigator_bar.dart';
import 'package:qrscanner/widgets/custom_scan_buton.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shadowColor: Colors.blueAccent,
        title: Text('Historial'),
        actions: [
          IconButton(icon: Icon(Icons.delete_forever), onPressed: () {})
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: CustomScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentIndex = 0;
    switch (currentIndex) {
      case 0:
        return HistoryMapPage();
      case 1:
        return DirectionsPage();
      default:
        return DirectionsPage();
    }
  }
}
