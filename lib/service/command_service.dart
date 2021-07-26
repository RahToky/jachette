
import 'package:bluekango/dao/command_dao.dart';
import 'package:bluekango/model/commands_entity.dart';
import 'package:bluekango/model/products_entity.dart';

class CommandService {

  CommandDao _commandDao = CommandDao();

  Future<List<Cart>> getCarts() async{
    return await _commandDao.getCarts();
  }

  List<Product> getProducts(){
    return null;
  }

  Product getProductById(int id){
    return null;
  }

  Product getProductById2(List<Product> products, int id){
    return null;
  }

  Future<Cart> getCartById(int id) async{
    return null;
  }


  /*
  UserService _userService = UserService();
  Future<List<Cart>> getCarts() async{
    List<Product> products = getProducts();
    List<Cart> carts = [
      Cart(id: 1, userId: 2, commands: [
        Command(id: 1, count: 1, productId: 6, cartId: 1,product: getProductById2(products,6)),
        Command(id: 2, count: 2, productId: 9, cartId: 1,product: getProductById2(products,9)),
        Command(id: 3, count: 1, productId: 3, cartId: 1,product: getProductById2(products,3)),
      ],user:await _userService.getUserById(2)),
      Cart(id: 2, userId: 3, commands: [
        Command(id: 1, count: 2, productId: 1, cartId: 2,product: getProductById2(products,1)),
        Command(id: 2, count: 2, productId: 4, cartId: 2,product: getProductById2(products,4)),
        Command(id: 3, count: 3, productId: 8, cartId: 2,product: getProductById2(products,8)),
      ],user:await _userService.getUserById(3)),
      Cart(id: 3, userId: 4, commands: [
        Command(id: 1, count: 5, productId: 11, cartId: 3,product: getProductById2(products,11)),
        Command(id: 2, count: 3, productId: 5, cartId: 3,product: getProductById2(products,5)),
        Command(id: 3, count: 2, productId: 7, cartId: 3,product: getProductById2(products,7)),
      ],user:await _userService.getUserById(4)),
    ];
    return Future.value(carts);
  }

  List<Product> getProducts(){
    return [
      Product(id: 1, name: 'Pull'),
      Product(id: 2, name: 'Jean'),
      Product(id: 3, name: 'Manteau'),
      Product(id: 4, name: 'Pair de chaussures'),
      Product(id: 5, name: 'Poulet grillé'),
      Product(id: 6, name: 'Andouillette'),
      Product(id: 7, name: 'Salade'),
      Product(id: 8, name: 'Poivron'),
      Product(id: 9, name: 'Burger'),
      Product(id: 10, name: 'Thon'),
      Product(id: 11, name: 'Riz'),
    ];
  }

  Product getProductById(int id){
    List<Product> products = getProducts();
    return getProductById2(products, id);
  }

  Product getProductById2(List<Product> products, int id){
    for(Product p in products){
      if(p.id == id) {
        return p;
      }
    }
    return null;
  }

  Future<Cart> getCartById(int id) async{
    List<Cart> carts = await getCarts();
    for(Cart c in carts){
      if(c.id == id)
        return c;
    }
    return null;
  }*/
}
