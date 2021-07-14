import 'package:flutter/material.dart';

class PhotoName extends StatelessWidget {
  final String title;
  final String image;
  PhotoName({@required this.image, @required this.title});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double photoWidth = size.width * 0.22;
    return Container(
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Container(
            width: photoWidth,
            height: photoWidth,
            child: Image.asset(image),
          ),
          const SizedBox(height: 20),
          Text(title, textScaleFactor: 1.8)
        ],
      ),
    );
  }
}
