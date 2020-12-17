import 'package:flutter/material.dart';
import 'package:qrscanner/widgets/scan_tiles.dart';

class HistoryMapPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScanTiles(type: 'geo');
  }
}
