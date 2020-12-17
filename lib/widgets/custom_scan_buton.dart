import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner/providers/scan_list_provider.dart';

class CustomScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    return FloatingActionButton(
        elevation: 10,
        focusColor: Colors.blueAccent,
        child: Icon(Icons.filter_center_focus),
        onPressed: () async {
          final barcodeScanRes = 'https://developer.android.com/studio/debug/dev-options';
          // scanListProvider.addNewElement(barcodeScanRes);
          scanListProvider.addNewElement('geo:15.44,23.44');
        });
  }
}
