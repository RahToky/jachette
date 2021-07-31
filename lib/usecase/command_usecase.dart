
import 'package:bluekango/dao/command_dao.dart';
import 'package:bluekango/model/commands_entity.dart';
import 'package:bluekango/model/products_entity.dart';

class CommandUseCase {

  CommandDao _commandDao = CommandDao();

  Future<List<Cart>> getCarts() async{
    return await _commandDao.getCarts();
  }

  Future<List<Command>> getCommandsByCartId(int cartId) async{
    return await _commandDao.getCommandsByCartId(cartId);
  }

}
