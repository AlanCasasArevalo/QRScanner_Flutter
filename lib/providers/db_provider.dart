import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:qrscanner/models/scan_model.dart';
export 'package:qrscanner/models/scan_model.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    // Path de la base de datos
    Directory documentsPath = await getApplicationDocumentsDirectory();
    final path = join(documentsPath.path, 'QRSScannerDB.db');
    print(path);

    return await openDatabase(
        path,
        // La version siempre ha de ser incrementada cada vez que cambie el modelo de datos, si se agregan nuevas propiedades
        version: 1,
        onOpen: (db) {},
    onCreate: (Database db, int version) async {
          await db.execute('''
            CREATE TABLE QRSScanner(
              id INTEGER PRIMARY KEY,
              type TEXT,
              value TEXT
            )
          ''');
    });
  }

  Future<int> addNewScanRaw (ScanModel newScan) async {
    final id = newScan.id;
    final type = newScan.type;
    final value = newScan.value;

    final db = await database;
    final res = db.rawInsert('''
      INSERT INTO QRSScanner(id, type, value)
        VALUES($id, '$type', '$value')
    ''');

    return res;
  }

  Future<int> addNewElement (ScanModel newScan) async {
    final db = await database;
    final res = db.insert('QRSScanner', newScan.toJson());
    // Res es el id del producto insertado.
    return res;
  }

  Future<ScanModel> getElementById (int id) async {
    final db = await database;
    final res = await db.query('QRSScanner', where: 'id = ?', whereArgs: [id]);
    ScanModel scanMapped = ScanModel.fromJson(res.first);
    return res.isNotEmpty ? scanMapped : null;
  }

  Future<List<ScanModel>> getAllElements () async {
    final db = await database;
    final res = await db.query('QRSScanner');
    List<ScanModel> scans = res.map((scan) => ScanModel.fromJson(scan)).toList();
    print(scans);
    return res.isNotEmpty ? scans : null;
  }

}
