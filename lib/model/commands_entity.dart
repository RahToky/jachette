import 'package:bluekango/model/entity.dart';
import 'package:bluekango/model/products_entity.dart';
import 'package:bluekango/model/users_entity.dart';
import 'package:flutter/cupertino.dart';

class Command {

  static String tableName = 'Command';
  int id;
  int idCart;
  int productId;
  int count;
  Product product;

  Command({this.id,@required this.idCart,@required this.productId,@required this.count,this.product});

  @override
  factory Command.fromMap(Map<String, dynamic> map) {
    // TODO: implement fromMap
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }

}

class Cart {

  int id;
  int userId;
  User user;
  List<Command> commands;

  Cart({@required this.id,@required this.userId, this.user, this.commands});

  @override
  factory Cart.fromMap(Map<String, dynamic> map) {
    // TODO: implement fromMap
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }

}