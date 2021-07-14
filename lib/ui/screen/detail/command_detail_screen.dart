import 'package:bluekango/ui/widget/photo_and_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommandDetailScreen extends StatelessWidget {
  static final String routeName = '/detail';

  @override
  Widget build(BuildContext context) {
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
                    image: 'assets/images/photo_1.png',
                    title: 'Quatrième transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
