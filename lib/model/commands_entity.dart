import 'package:bluekango/model/entity.dart';
import 'package:bluekango/model/products_entity.dart';
import 'package:bluekango/model/users_entity.dart';
import 'package:flutter/cupertino.dart';

class Command {

  static String tableName = 'Command';
  int id;
  int cartId;
  int productId;
  int count;
  Product product;

  Command(
      {this.id, @required this.cartId, @required this.productId, @required this.count, this.product});

  @override
  factory Command.fromMap(Map<String, dynamic> map) {
    return Command(id:map['id'],cartId:map['cartId'],productId:map['productId'],count:map['count']);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id':this.id,
      'cartId':this.cartId,
      'productId':this.productId,
      'count':this.count,
    };
  }

}

class Cart {

  static String tableName = 'Cart';

  int id;
  int userId;
  User user;
  List<Command> commands;

  Cart(
      {@required this.id, @required this.userId, this.user, this.commands});

  @override
  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(id:map['id'],userId:map['userId']);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id':this.id,
      'userId':this.userId,
    };
  }

}