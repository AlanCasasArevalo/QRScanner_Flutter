import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner/providers/scan_list_provider.dart';

class HistoryMapPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
        itemBuilder: (_, index) => ListTile(
          leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
          title: Text(scans[index].value),
          subtitle: Text('ID: ${scans[index].id.toString() }'),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () => print('${scans[index].id}'),
    ));
  }
}
