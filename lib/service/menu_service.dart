import 'package:bluekango/model/menu.dart';
import 'package:bluekango/service/base_service.dart';

class MenuService extends BaseService{

  Future<List<Menu>> getMenus() async {
    return await findAll(Menu(), Menu.tableName);
  }

}