import 'package:flutter/material.dart';
import 'package:qrscanner/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String typeSelected = 'http';

  addNewElement(String value) async {
    final newScan = ScanModel(value: value);
    final id = await DBProvider.db.addNewElement(newScan);
    newScan.id = id;

    if (this.typeSelected == newScan.type) {
      this.scans.add(newScan);
      notifyListeners();
    }
  }

  getAllElements() async {
    final scans = await DBProvider.db.getAllElements();
    this.scans = [...scans];
    notifyListeners();
  }

  getElementsByTypeRaw(String type) async {
    final scans = await DBProvider.db.getElementsByTypeRaw(type);
    this.scans = [...scans];
    this.typeSelected = type;
    notifyListeners();
  }

  deleteAllElement () async {
    await DBProvider.db.deleteAllElement();
    this.scans = [];
    notifyListeners();
  }

  deleteElementById (int id) async {
    await DBProvider.db.deleteElementById(id);
    this.scans.removeWhere((element) => id == element.id);
    notifyListeners();
  }
}
