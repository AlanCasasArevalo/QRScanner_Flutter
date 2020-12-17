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

    /************************************    Posición de la camara     ************************************/
    final CameraPosition _initialPoint = CameraPosition(
      target: _scanModel.getCoordinates(),
      zoom: 17,
      tilt: 50,
      bearing: 20
    );

    /************************************    Marcadores     ************************************/
    Set<Marker> markers = Set<Marker>();
    
    markers.add(Marker(
      markerId: MarkerId('geo-location'),
      position: _scanModel.getCoordinates()
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_location_outlined),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                  CameraUpdate.newCameraPosition(CameraPosition(
                      target: _scanModel.getCoordinates(),
                      zoom: 17,
                      tilt: 50,
                      bearing: 20
                  ))
              );
            },
          )
        ],
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: _initialPoint,
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.layers),
        onPressed: () {

        },
      ),
    );
  }
}
