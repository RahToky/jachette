import 'package:bluekango/callback/item_listener.dart';
import 'package:bluekango/model/menu.dart';
import 'package:bluekango/model/menu_link.dart';
import 'package:bluekango/service/menu_service.dart';
import 'package:bluekango/ui/screen/addresses/address_list_screen.dart';
import 'package:bluekango/ui/screen/cards/card_list_screen.dart';
import 'package:bluekango/ui/screen/commands/command_list_screen.dart';
import 'package:bluekango/ui/widget/menu_link_list.dart';
import 'package:bluekango/ui/widget/photo_and_name.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class HomeScreen extends StatefulWidget {
  static final String routeName = "/";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    implements ItemClickListener<String> {
  List<MenuLink> menus;

  MenuService _menuService;

  @override
  void initState() {
    _menuService = MenuService();
    initMenu();
    super.initState();
  }

  void initMenu() async{
    List<Menu> menuList = await _menuService.getMenus();
    menus = [];
    for(Menu menu in menuList){
      dev.log('title:${menu.title}');
      menus.add(MenuLink(menu.title,menu.route,getRightWidget(menu.isFavorite)));
    }
  }

  Widget getRightWidget(isFavorite) => Row(
        children: [
          if (isFavorite)
            IconButton(
              icon: Image.asset('assets/icons/icon_star.png', scale: 1.2),
              onPressed: () {},
            ),
          IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double photoNameHeight = size.height * 0.4;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: photoNameHeight,
              child: PhotoName(
                  image: 'assets/images/photo_oval.png', title: 'Mon app test'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: MenuLinkList(
                menus: this.menus,
                itemClickListener: this,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void onClick(item) {
    Navigator.pushNamed(context, item).then((value) => initMenu());
  }
}
