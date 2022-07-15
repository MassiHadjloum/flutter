import 'dart:io';
import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/models/dikr.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDatabase {
  SQLiteDatabase._init();
  static final SQLiteDatabase db = SQLiteDatabase._init();

  final String _databaseName = "adkar.db";
  final String table = "mousabiha";
  final columnId = '_id';
  final columnName = 'name';
  final columnTikrar = 'tikrar';
  final columnTotal = 'total';

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB();
    return _database!;
  }

  _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, _databaseName);
    //deleteDatabase(path);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE $table ( 
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnName TEXT NOT NULL,
        $columnTikrar SMALL INT NOT NULL,
        $columnTotal INT NOT NULL
        )''');
    Data.getJsonData(Data.mousabihaList).forEach((value) async {
      await db.rawInsert(
          '''INSERT INTO $table ($columnName, $columnTikrar, $columnTotal)
      VALUES ("${value['name']}", ${value['tikrar']}, ${value['total']} )''');
    });
  }

  Future<int> insert(Dikr tasbih) async {
    final dbase = await db.database;
    var res = await dbase.insert(table, tasbih.toJson());
    //print("insert new tasbih $tasbih $res");
    return res;
  }

  Future<int> deleteTasbih(String id) async {
    final dbase = await db.database;
    var res =
        await dbase.delete(table, where: "_id = ?", whereArgs: [int.parse(id)]);
    //print("deleted tasbih $id $res");
    return res;
  }

  Future<void> delete() async {
    final dbase = await db.database;
    await dbase.delete(table);
  }

  Future<int> update(Dikr tasbih) async {
    final dbase = await db.database;
    var res = await dbase.update(table, tasbih.toJson(),
        where: "_id = ?", whereArgs: [int.parse(tasbih.id)]);
    return res;
  }

  Future<int> updateResetTotal(Dikr tasbih) async {
    tasbih.total = 0;
    final dbase = await db.database;
    var res = await dbase.update(table, tasbih.toJson(),
        where: "_id = ?", whereArgs: [int.parse(tasbih.id)]);
    return res;
  }

  Future<List<Dikr>> getMousabihaList() async {
    final dbase = await db.database;
    List<Map> result = await dbase.query(table);
    List<Dikr> list = [];
     for(var element in result) {
      Dikr dikr = Dikr.fromMap(element as Map<String, dynamic>);
      list.add(dikr);
    }
    return list;
  }

  Future close() async {
    final dbase = await db.database;
    return dbase.close();
  }
}
