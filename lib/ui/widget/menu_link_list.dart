import 'package:bluekango/callback/item_listener.dart';
import 'package:bluekango/ui/widget/menu_link_list_item.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class MenuLinkList extends StatelessWidget {
  final ItemClickListener<String> itemClickListener;
  final menus;

  MenuLinkList({@required this.menus, @required this.itemClickListener});

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
                    child: MenuLinkItem(
                      text: menu['title'],
                      rightWidget: menu['rightWidget'] as Row,
                    ),
                  ),
                  Divider(height: 2, color: Colors.grey),
                ],
              ))
          .toList(),
    );
  }
}
