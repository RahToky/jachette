import 'package:bluekango/model/entity.dart';
import 'package:bluekango/model/listable_entity.dart';
import 'package:flutter/material.dart';

class Card extends ListableEntity{
  static String tableName = 'Card';
  int id;
  String type;
  String number;

  Card({this.id, @required this.type, @required this.number});

  @override
  List<String> getDetails() => [type,number];

  @override
  String getTitle()=> 'Card $id';

  @override
  factory Card.fromMap(Map<String, dynamic> map) {
    // TODO: implement fromMap
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
