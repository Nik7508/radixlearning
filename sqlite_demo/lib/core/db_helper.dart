import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:sqlite_demo/model/clientModel.dart';

class DBHelper {
  DBHelper._();
  static final DBHelper db = DBHelper._();

  static Database? _database;
  static String tableName = "Client";

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "Test.db");

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE $tableName ("
          "id INTEGER PRIMARY KEY,"
          "first_name TEXT,"
          "last_name TEXT,"
          "blocked BIT"
          ")");
    });
  }

  // newClient(Client newClient) async {
  //   final db = await database;
  //   var res = await db.rawInsert("INSERT Into Client (id,first_name)"
  //       " VALUES (${newClient.id},${newClient.firstName})");
  //   return res;
  // }
  newClient(Client newClient) async {
    final db = await database;
    var res = await db.insert(tableName, newClient.toMap());
    return res;
  }

  getClient(int id) async {
    final db = await database;
    var res = await db.query(tableName, where: "id=?", whereArgs: [id]);
    return res.isNotEmpty ? Client.fromMap(res.first) : Null;
  }

  Future<List<Client>> getAllClients() async {
    final db = await database;
    var res = await db.query("Client");
    List<Client> list =
        res.isNotEmpty ? res.map((c) => Client.fromMap(c)).toList() : [];
    return list;
  }

  updateClient(Client newClient) async {
    final db = await database;
    var res = await db.update("Client", newClient.toMap(),
        where: "id = ?", whereArgs: [newClient.id]);
    return res;
  }

  deleteClient(int id) async {
    final db = await database;
    db.delete("Client", where: "id = ?", whereArgs: [id]);
  }
}
