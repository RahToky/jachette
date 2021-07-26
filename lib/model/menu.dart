import 'package:bluekango/model/entity.dart';
import 'package:flutter/cupertino.dart';

class Menu extends Entity {
  static String tableName = 'Menu';

  int id;
  String title;
  String route;
  bool isFavorite;

  Menu(
      {this.id,
      @required this.title,
      @required this.route,
      this.isFavorite = false});

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'route': this.route,
      'is_favorite': this.isFavorite ? 1 : 0
    };
  }

  @override
  Menu fromMap(Map<String, dynamic> map) {
    return Menu(
      id: map['id'],
      title: map['title'],
      route: map['route'],
      isFavorite: map['is_favorite'] == 0 ? false : true,
    );
  }
}
