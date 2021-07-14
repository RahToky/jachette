import 'package:bluekango/callback/item_listener.dart';
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
  dynamic menus;

  @override
  void initState() {
    super.initState();
    menus = [
      {
        'route': '/commands',
        'title': 'Commandes sdfs',
        'isFavorite': true,
        'rightWidget': rightWidget(true)
      },
      {
        'route': '/addresses',
        'title': 'Mes adresses',
        'isFavorite': false,
        'rightWidget': rightWidget(false)
      },
      {
        'route': '/cards',
        'title': 'Mes cartes',
        'isFavorite': true,
        'rightWidget': rightWidget(true)
      },
    ];
  }

  Widget rightWidget(isFavorite) => Row(
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
                itemClickListener: this,
                menus: this.menus,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void onClick(item) {
    Navigator.pushNamed(context, item);
  }
}
