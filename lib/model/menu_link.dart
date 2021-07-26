import 'package:flutter/material.dart';

class MenuLink<T> {
  String title;
  String route;
  Widget rightWidget;
  T menu;

  MenuLink(this.title,this.route,this.rightWidget,this.menu);
}