import 'package:bluekango/dao/db_helper.dart';
import 'package:bluekango/model/entity.dart';
import 'package:sqflite/sqflite.dart';

class BaseDao{

  DatabaseHelper databaseHelper = DatabaseHelper.instance;

  // Helper methods
  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(String tableName, Map<String, dynamic> row) async {
    Database db = await databaseHelper.database;
    return await db.insert(tableName, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<T>> findAll<T extends Entity>(T entity,String tableName) async {
    Database db = await databaseHelper.database;
    List<Map<String,dynamic>> mapList = await db.query(tableName, columns: ["*"], orderBy: "id ASC");
    return List.generate(mapList.length, (index){
      return entity.fromMap(mapList[index]);
    });
  }

  Future<T> findById<T extends Entity>(T entity, int id, String tableName) async{
    final db = await databaseHelper.database;
    var result = await db.query("Product", where: "id = ", whereArgs: [id]);
    return result.isNotEmpty ? entity.fromMap(result.first) : Null;
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> rowCount(String tableName) async {
    Database db = await databaseHelper.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row, String tableName) async {
    Database db = await databaseHelper.database;
    int id = row['id'];
    return await db.update(tableName, row, where: 'id = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id, String tableName) async {
    Database db = await databaseHelper.database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}