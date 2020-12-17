import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qrscanner/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapDetailPage extends StatefulWidget {
  @override
  _MapDetailPageState createState() => _MapDetailPageState();
}

class _MapDetailPageState extends State<MapDetailPage> {
  @override
  Widget build(BuildContext context) {

    Completer<GoogleMapController> _controller = Completer();

    final ScanModel _scanModel = ModalRoute.of(context).settings.arguments;

    final CameraPosition _initialPoint = CameraPosition(
      target: _scanModel.getCoordinates(),
      zoom: 17,
      tilt: 50,
      bearing: 20
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialPoint,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}