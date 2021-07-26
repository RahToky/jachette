import 'package:bluekango/callback/item_listener.dart';
import 'package:bluekango/model/menu_link.dart';
import 'package:bluekango/ui/widget/menu_link_list_item.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class MenuLinkList extends StatelessWidget {
  final ItemClickListener itemClickListener;
  final List<MenuLink> menus;

  MenuLinkList({@required this.menus, @required this.itemClickListener});

  @override
  Widget build(BuildContext context) {
    return menus!=null?Column(
      children: menus
          .map((menu) => Column(
                children: [
                  itemClickListener != null?InkWell(
                    onTap: () {
                      itemClickListener.onClick(menu.menu);
                    },
                    child: MenuLinkItem(
                      text: menu.title,
                      rightWidget: menu.rightWidget,
                    ),
                  ):MenuLinkItem(
                    text: menu.title,
                    rightWidget: menu.rightWidget,
                  ),
                  Divider(height: 2, color: Colors.grey),
                ],
              ))
          .toList(),
    ):Center(
      child: CircularProgressIndicator(),
    );
  }
}
