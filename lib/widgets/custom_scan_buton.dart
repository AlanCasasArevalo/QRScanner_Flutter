import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner/providers/scan_list_provider.dart';
import 'package:qrscanner/utils/utils.dart';

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
          // final barcodeScanRes = 'geo:40.0967324,-4.0538371';

          // si el barcode no es de los que hemos implementado se pasa del tema.
          if(barcodeScanRes == '-1') {
            return;
          }
          final scan = await scanListProvider.addNewElement(barcodeScanRes);
          launchURL(context, scan);
        });
  }
}
