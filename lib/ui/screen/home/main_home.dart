import 'package:bluekango/ui/widget/photo_and_name.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = "/";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double profilContainerHeight = size.height*0.4;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: profilContainerHeight,
              child: PhotoName(),
            ),

          ],
        ),
      ),
    );
  }
}
