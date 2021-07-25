import 'package:bluekango/model/entity.dart';
import 'package:flutter/cupertino.dart';

class Product{

  static String tableName = 'Product';
  int id;
  String name;

  Product({this.id,@required this.name});

  @override
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(id:map['id'],name:map['name']);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id':this.id,
      'name':this.name,
    };
  }

}