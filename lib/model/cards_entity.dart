import 'package:bluekango/model/listable_entity.dart';
import 'package:flutter/material.dart';

class Card extends ListableEntity{
  int id;
  String type;
  String number;

  Card({@required this.id, @required this.type, @required this.number});

  @override
  List<String> getDetails() => [type,number];

  @override
  String getTitle()=> 'Card $id';
}
