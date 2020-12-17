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
        itemBuilder: (_, index) => Dismissible(
          key: UniqueKey(),
          background: Container(
            color: Colors.red,
            child: Center(child: Text('Deleting .....', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),)),
          ),
          onDismissed: (DismissDirection direction) {
            // Debemos poner el listen a falso para que no nos de error al borrar los elementos Failed assertion: line 262 pos 7: 'context.owner.debugBuilding ||
            //           listen == false ||
            //           debugIsInInheritedProviderUpdate'
            // Provider.of<ScanListProvider>(context).deleteElementById(scans[index].id);
            Provider.of<ScanListProvider>(context, listen: false).deleteElementById(scans[index].id);
          },
          child: ListTile(
            leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
            title: Text(scans[index].value),
            subtitle: Text('ID: ${scans[index].id.toString() }'),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
            onTap: () => print('${scans[index].id}'),
    ),
        ));
  }
}
