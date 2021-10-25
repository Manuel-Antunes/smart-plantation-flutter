import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Future<Database> getConnection() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "smart_plantations.db");
    Database db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  static FutureOr<void> _onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE user (id INTEGER PRIMARY KEY, name VARCHAR(255), email VARCHAR(255), photoUrl VARCHAR(255))';
    await db.execute(sql);
  }
}
