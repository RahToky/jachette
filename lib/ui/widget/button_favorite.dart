import 'package:bluekango/callback/item_listener.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {

  ItemClickListener itemClickListener;
  FavoriteButton(this.itemClickListener);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: TextButton(
        child: Text('Ajouter cette page aux favoris',style: TextStyle(color: Colors.black),textScaleFactor: 1.2,),
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(20),
          backgroundColor: Colors.orange.shade300,
          side: BorderSide(color: Colors.grey,width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: (){
          if(itemClickListener != null)
            itemClickListener.onClick(null);
        },
      ),
    );
  }
}
