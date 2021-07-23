import 'package:bluekango/model/entity.dart';
import 'package:flutter/cupertino.dart';

class Menu{

  static String tableName = 'Menu';

  String id;
  String title;
  String route;
  bool isFavorite;

  Menu({this.id, @required this.title, @required this.route,this.isFavorite = false});

  Map<String,dynamic> toMap(){
    return {
      'id':this.id,
      'title':this.title,
      'route':this.route,
      'is_favorite':this.isFavorite
    };
  }

  factory Menu.fromMap(Map<String, dynamic> map) {
    return Menu(
      id:map['id'],
      title: map['title'],
      route:map['route'],
      isFavorite: map['is_favorite'],
    );
  }

}