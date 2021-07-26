import 'package:bluekango/model/entity.dart';
import 'package:bluekango/model/listable_entity.dart';
import 'package:flutter/material.dart';

class Card extends ListableEntity implements Entity{
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
  Card fromMap(Map<String, dynamic> map) {
    return Card(id:map['id'],type: map['type'],number: map['number']);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id':this.id,
      'type':this.type,
      'number':this.number
    };
  }
}
