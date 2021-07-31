import 'package:bluekango/model/menu.dart';
import 'package:bluekango/usecase/base_usecase.dart';

class MenuUseCase extends BaseUseCase{

  Future<List<Menu>> getMenus() async {
    return await findAll(Menu(), Menu.tableName);
  }

  Future<int> setFavorite(int menuId,bool isFavorite) async{
    return await baseDao.update({'id':menuId, 'is_favorite':isFavorite?1:0}, Menu.tableName);
  }

}