import 'package:flutter/material.dart';

class ScreenLinkItem extends StatefulWidget {
  final String text;

  ScreenLinkItem(this.text);

  @override
  _ScreenLinkItemState createState() => _ScreenLinkItemState();
}

class _ScreenLinkItemState extends State<ScreenLinkItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.text,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(icon: Image.asset('assets/images/icons/icon_star.png'), onPressed: (){}),
        IconButton(icon: Icon(Icons.arrow_forward_ios_outlined), onPressed: (){}),
      ],
    );
  }
}
