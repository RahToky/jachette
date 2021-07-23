import 'package:bluekango/dao/db_helper.dart';
import 'package:bluekango/model/menu.dart';

class MenuService{

  DatabaseHelper _databaseHelper;

  MenuService(){
    _databaseHelper = DatabaseHelper.instance;
  }

  Future<List<Menu>> getMenus() async {
    /*return Future.value([
      Menu(title: 'Commandes',route:'/commands',isFavorite: true),
      Menu(title: 'Mes adresses',route:'/addresses',isFavorite: false),
      Menu(title: 'Mes cartes',route:'/cards',isFavorite: true),
    ]);*/
    // return _databaseHelper.findAll(ETable.MENUS);
    List<Map<String,dynamic>> mapList = await _databaseHelper.findAll(Menu.tableName);
    return List.generate(mapList.length, (index){
      return Menu.fromMap(mapList[index]);
    });
  }

}