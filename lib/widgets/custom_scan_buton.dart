import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class CustomScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 10,
        focusColor: Colors.blueAccent,
        child: Icon(Icons.filter_center_focus),
        onPressed: () async {
          final barcodeScanRes = 'https://developer.android.com/studio/debug/dev-options';
          print(barcodeScanRes);
        });
  }
}
