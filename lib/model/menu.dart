import 'package:flutter/cupertino.dart';

class Menu{
  String id;
  String title;
  String route;
  bool isFavorite;

  Menu({this.id, @required this.title, @required this.route,this.isFavorite = false});
}