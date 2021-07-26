import 'package:bluekango/callback/item_listener.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {

  bool isFavorite;
  final ItemClickListener itemClickListener;

  FavoriteButton({this.isFavorite,@required this.itemClickListener});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {

  final List<String> _buttonText = ['Ajouter cette page aux favoris','Supprimer des favoris'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: TextButton(
        child: Text(_buttonText[widget.isFavorite?1:0],style: TextStyle(color: widget.isFavorite?Colors.white:Colors.black),textScaleFactor: 1.2,),
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(20),
          backgroundColor: widget.isFavorite?Colors.red:Colors.orange.shade300,
          side: BorderSide(color: Colors.grey,width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: (){
          if(widget.itemClickListener != null) {
            widget.itemClickListener.onClick(null);
            setState(() {
              widget.isFavorite = !widget.isFavorite;
            });
          }
        },
      ),
    );
  }
}
