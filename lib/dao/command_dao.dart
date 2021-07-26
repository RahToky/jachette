import 'package:bluekango/dao/base_dao.dart';
import 'package:bluekango/model/commands_entity.dart';
import 'package:bluekango/model/products_entity.dart';
import 'package:bluekango/model/users_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:developer' as dev;

class CommandDao extends BaseDao {
  Future<List<Cart>> getCarts() async {
    Database db = await databaseHelper.database;
    String query = '''
        SELECT c.id, c.userId, u.name,u.photo 
        FROM ${Cart.tableName} c JOIN ${User.tableName} u on u.id = c.userId
        ''';

    List<Map<String, dynamic>> cartList = await db.rawQuery(query);
    dev.log('carts = ${cartList.toString()}');

    List<Cart> carts = [];
    for(Map<String,dynamic> map in cartList){
        Cart cart = Cart(
          id: map['id'],
          userId: map['userId'],
          user: User(
            id: map['userId'],
            name: map['name'],
            photo: map['photo'],
          ),
        );
        cart.commands = await findCommandsByCartId(map['id']);
        carts.add(cart);
    }
    return carts;
  }

  Future<List<Command>> findCommandsByCartId(int cartId) async{
    Database db = await databaseHelper.database;
    String query = '''
        SELECT *
        FROM ${Command.tableName} c JOIN ${Product.tableName} p on p.id = c.productId WHERE c.cartId = ?
        ''';
    List<Map<String, dynamic>> commandList = await db.rawQuery(query,['$cartId']);
    dev.log('\n');
    dev.log('commands = ${commandList.toString()}');
    return commandList.map((c) {
      Command command = Command().fromMap(c);
      command.product = Product(
        id: command.productId,
        name: c['name']
      );
      return command;
    }).toList();
  }
}
