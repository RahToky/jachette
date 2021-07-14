import 'package:bluekango/callback/item_listener.dart';
import 'package:bluekango/ui/widget/menu_list.dart';
import 'package:bluekango/ui/widget/photo_and_name.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class HomeScreen extends StatefulWidget {
  static final String routeName = "/";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> implements ItemClickListener<String>{

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
              child: PhotoName(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: MenuList(this),
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
