import 'package:bluekango/model/products_entity.dart';
import 'package:bluekango/model/users_entity.dart';
import 'package:flutter/cupertino.dart';

class Command {

  int id;
  int idCart;
  int productId;
  int count;
  Product product;

  Command({@required this.id,@required this.idCart,@required this.productId,@required this.count,this.product});

}

class Cart {

  int id;
  int userId;
  User user;
  List<Command> commands;

  Cart({@required this.id,@required this.userId, this.user, this.commands});

}