
import 'package:bluekango/callback/item_listener.dart';
import 'package:bluekango/ui/widget/menu_list_item.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class MenuList extends StatelessWidget {
  final ItemClickListener<String> itemClickListener;

  MenuList(this.itemClickListener);

  final menus = [
    {'route': '/commands', 'title': 'Commandes', 'isFavorite': true},
    {'route': '/addresses', 'title': 'Mes adresses', 'isFavorite': false},
    {'route': '/cards', 'title': 'Mes cartes', 'isFavorite': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: menus
          .map((menu) => Column(
                children: [
                  InkWell(
                    onTap: () {
                      itemClickListener.onClick(menu['route']);
                    },
                    child: MenuItem(
                      text: menu['title'],
                      isFavorite: menu['isFavorite'],
                    ),
                  ),
                  Divider(height: 2, color: Colors.grey),
                ],
              ))
          .toList(),
    );
  }
}
