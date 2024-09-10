import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _database;
  static const String TABLE_TRANSACTION = "mytransaction";
  static const String DATABASE_NAME = "flutter8.db";
  static const int DATABASE_VERSION = 1;
  static const int SUCCESS = 1;
  static const int ERROR = -1;
  // CREATE TABLES
  //id,title,detail,amount,date,flag(1=expense,2=income)
  static const String CREATE_TABLE_TRANSACTION = "CREATE TABLE IF NOT EXISTS " +
      TABLE_TRANSACTION +
      "(_id integer primary key autoincrement, title text, detail text, amount  int, date text, flag INTEGER)";

  Future<Database> get db async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  initDatabase() async {
    Directory DocumentDirectory = await getApplicationDocumentsDirectory();
    String path = DocumentDirectory.path + DATABASE_NAME;
    print('=====Database path==== ' + path);
    var db = await openDatabase(path,
        version: DATABASE_VERSION, onCreate: CREATE_TABLES_OF_PROJECT);
    return db;
  }

  Future CREATE_TABLES_OF_PROJECT(Database db, int version) async {
    await db.execute(CREATE_TABLE_TRANSACTION);
    print('=====table created==== ');
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }

  //insert/update/delete sql command (any command other then select)
  Future<int> RunQuery(String sql) async {
    print(sql);
    try {
      await _database!.execute(sql);
      return SUCCESS;
    } catch (e) {
      print(e.toString());
      return ERROR;
    }
  }
  //used to execute only select statement
  Future<List<Map<String, Object?>>?> FetchDataFromTable(String sql) async {
    print(sql);
    try {
      List<Map<String,Object?>> table = await _database!.rawQuery(sql);
      return table;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


}
