
import 'dart:developer' as dev;

import 'package:bluekango/model/menu.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "bluekango.test.db";
  static final _databaseVersion = 5;

  // make this a singleton class
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;

  Future<Database> get database async {
    dev.log('get database');
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    dev.log('init database');
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    dev.log('onCreate');
    await db.execute(/*'''
          CREATE TABLE ${User.tableName} (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            photo TEXT
          );
          CREATE TABLE ${Product.tableName} (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL
          );
          CREATE TABLE ${Command.tableName} (
            id INTEGER PRIMARY KEY,
            userId INTEGER NOT NULL,
            productId INTEGER NOT NULL,
            count INTEGER
          );
          CREATE TABLE ${Address.tableName} (
            id INTEGER PRIMARY KEY,
             street TEXT,
            address TEXT NOT NULL
          );
          CREATE TABLE ${Card.tableName} (
            id INTEGER PRIMARY KEY,
             type TEXT NOT NULL,
            number INTEGER NOT NULL
          );*/
          '''CREATE TABLE ${Menu.tableName}(
            id INTEGER PRIMARY KEY,
            title TEXT NOT NULL,
            route TEXT,
            is_favorite INTEGER
            );
          INSERT INTO ${Menu.tableName} (id,title,route,is_favorite) values (1,'Commm','/commands',0);
          ''');
  }

  // Helper methods
  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(String tableName,Map<String,dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableName, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String,dynamic>>> findAll(String tableName) async {

    Database db = await instance.database;
    dev.log('find ALL');
    List<Map<String,dynamic>> res = await db.query(tableName, columns: ["*"], orderBy: "id ASC");
    return res;
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> rowCount(String tableName) async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row,String tableName) async {
    Database db = await instance.database;
    int id = row['id'];
    return await db.update(tableName, row, where: 'id = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id,String tableName) async {
    Database db = await instance.database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
