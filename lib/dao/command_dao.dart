import 'package:bluekango/dao/base_dao.dart';
import 'package:bluekango/model/commands_entity.dart';
import 'package:bluekango/model/products_entity.dart';
import 'package:bluekango/model/users_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:developer' as dev;

class CommandDao extends BaseDao {
  Future<List<Cart>> getCarts() async {
    final Database db = await databaseHelper.database;
    List<Cart> carts = [];

    String cartQuery = '''
    SELECT c.id,c.userId,u.name,u.photo FROM ${Cart.tableName} c join ${User.tableName} u on u.id=c.userId
    ''';

    List<Map<String, dynamic>> cartMapList = await db.rawQuery(cartQuery);

    for (Map<String, dynamic> cartMap in cartMapList) {
      Cart c = Cart();
      c = c.fromMap(cartMap);
      c.user = User(id: c.userId, name: cartMap['name'], photo: cartMap['photo']);
      c.commands = await getCommandsByCartId(c.id);
      carts.add(c);
    }
    return await Future.value(carts);
  }

  Future<List<Command>> getCommandsByCartId(int cartId) async{
    final Database db = await databaseHelper.database;
    String commandsQuery = '''
        SELECT * FROM ${Command.tableName} cmd JOIN ${Cart.tableName} c on c.id = cmd.cartId JOIN ${Product.tableName} p on p.id = cmd.productId WHERE cmd.cartId = ?
        ''';
    List<Map<String, dynamic>> commandsMapList =
    await db.rawQuery(commandsQuery, [cartId]);
    List<Command> commands = [];

    for (Map<String, dynamic> commandMap in commandsMapList) {
      Command command = Command();
      command = command.fromMap(commandMap);
      command.product = Product();
      command.product = command.product.fromMap(commandMap);
      commands.add(command);
    }
    return Future.value(commands);
  }
}
