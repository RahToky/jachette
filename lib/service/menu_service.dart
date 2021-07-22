import 'package:bluekango/model/menu.dart';

class MenuService{

  Future<List<Menu>> getMenus(){
    return Future.value([
      Menu(title: 'Commandes',route:'/commands',isFavorite: true),
      Menu(title: 'Mes adresses',route:'/addresses',isFavorite: false),
      Menu(title: 'Mes cartes',route:'/cards',isFavorite: true),
    ]);
  }

}