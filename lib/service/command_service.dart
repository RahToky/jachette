
import 'package:bluekango/dao/command_dao.dart';
import 'package:bluekango/model/commands_entity.dart';
import 'package:bluekango/model/products_entity.dart';

class CommandService {

  CommandDao _commandDao = CommandDao();

  Future<List<Cart>> getCarts() async{
    return await _commandDao.getCarts();
  }

}
