import 'package:flutter/material.dart';

class MenuLinkItem extends StatefulWidget {
  final String text;
  Widget rightWidget;

  MenuLinkItem({@required this.text, @required this.rightWidget});

  @override
  _MenuLinkItemState createState() => _MenuLinkItemState();
}

class _MenuLinkItemState extends State<MenuLinkItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.text,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 1.4,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          widget.rightWidget,
        ],
      ),
    );
  }
}
