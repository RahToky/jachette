import 'dart:developer' as dev;

import 'package:bluekango/model/addresses_entity.dart';
import 'package:bluekango/model/cards_entity.dart';
import 'package:bluekango/model/commands_entity.dart';
import 'package:bluekango/model/menu.dart';
import 'package:bluekango/model/products_entity.dart';
import 'package:bluekango/model/users_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "bluekango.test.db";
  static final _databaseVersion = 1;
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // make this a singleton class
  DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;

  Future<Database> get database async {
    dev.log('get database');
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    dev.log('get database');
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    dev.log('init database');
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    dev.log('onCreate');
    await db.execute('''
          CREATE TABLE ${User.tableName} (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            photo TEXT
          )
          ''');
    await db.execute('''
          CREATE TABLE ${Product.tableName} (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL
          );
          ''');

    await db.execute('''
          CREATE TABLE ${Cart.tableName} (
            id INTEGER PRIMARY KEY,
            userId INTEGER NOT NULL
          )
    ''');

    await db.execute('''
          CREATE TABLE ${Command.tableName} (
            id INTEGER PRIMARY KEY,
            cartId INTEGER NOT NULL,
            productId INTEGER NOT NULL,
            count INTEGER
          )
    ''');
    await db.execute('''
          CREATE TABLE ${Address.tableName} (
            id INTEGER PRIMARY KEY,
             street TEXT,
            address TEXT NOT NULL
          )
    ''');
    await db.execute('''
          CREATE TABLE ${Card.tableName} (
            id INTEGER PRIMARY KEY,
             type TEXT NOT NULL,
            number TEXT NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE ${Menu.tableName}(
            id INTEGER PRIMARY KEY,
            title TEXT NOT NULL,
            route TEXT,
            is_favorite INTEGER
            );
          ''');

    dev.log('insert database');
    db.rawInsert(
        'INSERT INTO ${Menu.tableName} (id,title,route,is_favorite) values (?,?,?,?)',
        [1, 'Commandes', '/commands', 1]);
    db.rawInsert(
        'INSERT INTO ${Menu.tableName} (id,title,route,is_favorite) values (?,?,?,?)',
        [2, 'Mes adresses', '/addresses', 0]);
    db.rawInsert(
        'INSERT INTO ${Menu.tableName} (id,title,route,is_favorite) values (?,?,?,?)',
        [3, 'Mes cartes', '/cards', 1]);

    db.rawInsert('INSERT INTO ${User.tableName} (id,name,photo) values (?,?,?)',
        [1, 'Antonio', 'photo_oval.png']);
    db.rawInsert('INSERT INTO ${User.tableName} (id,name,photo) values (?,?,?)',
        [2, 'Sarah', 'photo_1.png']);
    db.rawInsert('INSERT INTO ${User.tableName} (id,name,photo) values (?,?,?)',
        [3, 'Harry', 'photo_2.png']);
    db.rawInsert('INSERT INTO ${User.tableName} (id,name,photo) values (?,?,?)',
        [4, 'Ben', 'photo_3.png']);

    db.rawInsert(
        'INSERT INTO ${Address.tableName} (id,street,address) values (?,?,?)',
        [1, '8 rue des Pamlmiers', '76890 Là bas']);
    db.rawInsert(
        'INSERT INTO ${Address.tableName} (id,street,address) values (?,?,?)',
        [2, '143 allée des Mimosas', '83000 Hyères']);
    db.rawInsert(
        'INSERT INTO ${Address.tableName} (id,street,address) values (?,?,?)',
        [3, '78 rue des chemins', '14000 Caen']);
    db.rawInsert(
        'INSERT INTO ${Address.tableName} (id,street,address) values (?,?,?)',
        [4, '1065 avenue du rêve', '69000 Lyon']);

    db.rawInsert(
        'INSERT INTO ${Card.tableName} (id,type,number) values (?,?,?)',
        [1, 'Mastercard', '1234567890']);
    db.rawInsert(
        'INSERT INTO ${Card.tableName} (id,type,number) values (?,?,?)',
        [2, 'VISA', '0987654321']);
    db.rawInsert(
        'INSERT INTO ${Card.tableName} (id,type,number) values (?,?,?)',
        [3, 'American Express', '56473829102']);

    db.rawInsert('INSERT INTO ${Cart.tableName} (id,userId) values (?,?)', [1, 2]);
    db.rawInsert('INSERT INTO ${Cart.tableName} (id,userId) values (?,?)', [2, 3]);
    db.rawInsert('INSERT INTO ${Cart.tableName} (id,userId) values (?,?)', [3, 4]);

    db.rawInsert('INSERT INTO ${Command.tableName} (id,cartId,productId,count) values (?,?,?,?)', [1, 1,1,2]);
    db.rawInsert('INSERT INTO ${Command.tableName} (id,cartId,productId,count) values (?,?,?,?)', [2, 1,2,1]);
    db.rawInsert('INSERT INTO ${Command.tableName} (id,cartId,productId,count) values (?,?,?,?)', [3, 1,3,2]);
    db.rawInsert('INSERT INTO ${Command.tableName} (id,cartId,productId,count) values (?,?,?,?)', [4, 2,9,5]);
    db.rawInsert('INSERT INTO ${Command.tableName} (id,cartId,productId,count) values (?,?,?,?)', [5, 2,7,5]);
    db.rawInsert('INSERT INTO ${Command.tableName} (id,cartId,productId,count) values (?,?,?,?)', [6, 3,5,3]);
    db.rawInsert('INSERT INTO ${Command.tableName} (id,cartId,productId,count) values (?,?,?,?)', [7, 3,7,3]);
    db.rawInsert('INSERT INTO ${Command.tableName} (id,cartId,productId,count) values (?,?,?,?)', [8, 3,11,2]);

    db.rawInsert('INSERT INTO ${Product.tableName} (id,name) values (?,?)', [1, 'Pull']);
    db.rawInsert('INSERT INTO ${Product.tableName} (id,name) values (?,?)', [2, 'Jean']);
    db.rawInsert('INSERT INTO ${Product.tableName} (id,name) values (?,?)', [3, 'Manteau']);
    db.rawInsert('INSERT INTO ${Product.tableName} (id,name) values (?,?)', [4, 'Pair de chaussures']);
    db.rawInsert('INSERT INTO ${Product.tableName} (id,name) values (?,?)', [5, 'Poulet grillé']);
    db.rawInsert('INSERT INTO ${Product.tableName} (id,name) values (?,?)', [6, 'Andouillette']);
    db.rawInsert('INSERT INTO ${Product.tableName} (id,name) values (?,?)', [7, 'Salade']);
    db.rawInsert('INSERT INTO ${Product.tableName} (id,name) values (?,?)', [8, 'Poivron']);
    db.rawInsert('INSERT INTO ${Product.tableName} (id,name) values (?,?)', [9, 'Burger']);
    db.rawInsert('INSERT INTO ${Product.tableName} (id,name) values (?,?)', [10, 'Thon']);
    db.rawInsert('INSERT INTO ${Product.tableName} (id,name) values (?,?)', [11, 'Riz']);
  }
}
