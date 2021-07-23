import 'package:bluekango/model/entity.dart';
import 'package:flutter/cupertino.dart';

class Product{

  static String tableName = 'Product';
  int id;
  String name;

  Product({this.id,@required this.name});

  @override
  factory Product.fromMap(Map<String, dynamic> map) {
    // TODO: implement fromMap
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }

}