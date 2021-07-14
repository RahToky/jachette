import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  final String text;
  final bool isFavorite;

  MenuItem({@required this.text, this.isFavorite = false});

  @override
  _MenuItemState createState() => _MenuItemState();

}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10,bottom: 10),
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
          if (widget.isFavorite)
            IconButton(
              icon: Image.asset('assets/icons/icon_star.png',scale: 1.2),
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
      ),
    );
  }
}
