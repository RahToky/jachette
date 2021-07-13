import 'package:flutter/material.dart';

class PhotoName extends StatelessWidget {
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
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: const AssetImage('assets/images/photo_oval.png'),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text("Mon app test", textScaleFactor: 1.8)
        ],
      ),
    );
  }
}
