import 'package:bluekango/model/commands_entity.dart';
import 'package:bluekango/ui/widget/photo_and_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class CommandDetailScreen extends StatelessWidget {
  static final String routeName = '/command_detail';

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    Cart _cart = arguments['cart'] as Cart;

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
                    title: '${_cart.id} transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
