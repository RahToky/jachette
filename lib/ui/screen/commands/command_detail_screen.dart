import 'package:bluekango/callback/command_add_listener.dart';
import 'package:bluekango/model/commands_entity.dart';
import 'package:bluekango/model/menu_link.dart';
import 'package:bluekango/ui/screen/commands/command_count_button.dart';
import 'package:bluekango/ui/widget/menu_link_list.dart';
import 'package:bluekango/ui/widget/photo_and_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class CommandDetailScreen extends StatefulWidget {
  static final String routeName = '/command_detail';

  @override
  _CommandDetailScreenState createState() => _CommandDetailScreenState();
}

class _CommandDetailScreenState extends State<CommandDetailScreen>
    implements AddCommandListener {
  List<MenuLink> menus;
  Cart _cart;

  void createMenus(Cart cart) {
    menus = _cart.commands.map((c) {
      return MenuLink(
          c.product.name,
          null,
          CommandCountBtn(
              commandId: c.id, count: c.count, addCommandListener: this));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    _cart = arguments['cart'] as Cart;
    createMenus(_cart);

    final Size size = MediaQuery.of(context).size;
    final double photoNameHeight = size.height * 0.3;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: photoNameHeight,
                child: PhotoName(
                  image: 'assets/images/${_cart.user.photo}',
                  title: '${_cart.id} transaction',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    MenuLinkList(menus: menus, itemClickListener: null),
                    MenuLinkList(menus: [
                      MenuLink(
                          'Ajouter élément',
                          '',
                          IconButton(
                            icon: Image.asset('assets/icons/icon_plus.png',
                                scale: 1.2),
                            onPressed: () {},
                          ))
                    ], itemClickListener: null),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void removeFromListById(int id) {
    setState(() {
      menus.removeAt(id);
    });
  }

  @override
  void onAdd(int commandId, int count) {}

  @override
  void onRemove(int commandId, int count) {
    for (int i = 0; i < _cart.commands.length; i++) {
      if (_cart.commands[i].id == commandId) {
        if (count == 0) {
          setState(() {
            _cart.commands.removeAt(i);
          });
        } else {
          _cart.commands[i].count = count;
        }
      }
    }
  }
}
