import 'package:flutter/material.dart';
import 'package:qrscanner/models/scan_model.dart';

class MapDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScanModel _scanModel = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: Center(
        child: Text(_scanModel.value),
      ),
    );
  }
}
